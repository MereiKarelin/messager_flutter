import 'package:injectable/injectable.dart';
import 'package:messager/core/utils/database_service.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton(as: DatabaseService)
class DatabaseServiceImpl implements DatabaseService {
  Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'message.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  @override
  Future<Database> initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path, version: 5, onUpgrade: upgrade,
        onCreate: (db, version) async {
      await create(db, version);

      // Добавляем начальные данные при создании базы данных
      final MessageCategoryModel messageCategoryModel = MessageCategoryModel(
        categoryes: [
          Categorye(
            uid: "example_uid1",
            firstname: "Мерей",
            lastname: "Медгат",
            lastMessage: "Дарова",
            lastMessageDate: 1643084400,
            lastMessageByMe: 1,
          ),
          Categorye(
            uid: "example_uid2",
            firstname: "Виктор",
            lastname: "Цой",
            lastMessage: "Привет, я на самом деле жив",
            lastMessageDate: 1643084500,
            lastMessageByMe: 0,
          ),
          Categorye(
            uid: "example_uid3",
            firstname: "Курт",
            lastname: "Кобейн",
            lastMessage: "Sup!",
            lastMessageDate: 1643084600,
            lastMessageByMe: 0,
          ),
        ],
      );

      await insertInitialData(db, messageCategoryModel);
    }, singleInstance: true);
    return database;
  }

  @override
  void upgrade(Database database, int oldVersion, int newVersion) async {
    // Миграция базы данных здесь
    if (oldVersion < 4) {
      // Добавьте изменения структуры таблицы
      await database.execute('ALTER TABLE message ADD COLUMN senderUid TEXT');
      await database.execute('ALTER TABLE message ADD COLUMN receiverUid TEXT');
    }
  }

  @override
  Future<void> insertInitialData(
      Database database, MessageCategoryModel initialData) async {
    // Вставляем начальные данные в таблицу "category"

    for (Categorye category in initialData.categoryes!) {
      await database.insert('category', category.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      final currentTime = DateTime.now()
              .subtract(const Duration(hours: 1))
              .millisecondsSinceEpoch ~/
          1000;

      final messageData = Message(
          data: category.lastMessage,
          dataTime: currentTime,
          uid: category.lastMessageByMe == 1 ? "me" : category.uid,
          senderUid: category.uid,
          receiverUid: 'me');
      await database.insert('message', messageData.toJson());
    }
  }

  @override
  Future<void> create(Database database, int version) async {
    // Создаем таблицу для категорий сообщений (людей)
    await database.execute('''
    CREATE TABLE IF NOT EXISTS category (
      uid TEXT PRIMARY KEY,
      firstname TEXT,
      lastname TEXT,
      last_message TEXT,
      last_message_date INTEGER,
      last_message_by_me INTEGER
    )
  ''');

    // Создаем таблицу для сообщений
    await database.execute('''
  CREATE TABLE IF NOT EXISTS message (
    data TEXT,
    dataTime INTEGER,
    uid TEXT,
    senderUid TEXT,
    receiverUid TEXT,
    FOREIGN KEY (senderUid) REFERENCES category (uid),
    FOREIGN KEY (receiverUid) REFERENCES category (uid)
  )
''');
  }
}
