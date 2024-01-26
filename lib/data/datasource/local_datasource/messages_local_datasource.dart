import 'package:injectable/injectable.dart';
import 'package:messager/core/utils/database_service.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';

abstract class MessageLocalDataSource {
  Future<MessageCategoryModel> getCategoryList();
  Future<MessagesModel> getMessagesList(String uid);
  Future<MessagesModel> sendMessage(String uid, String message);
}

@LazySingleton(as: MessageLocalDataSource)
class MessageLocalDataSourceImpl implements MessageLocalDataSource {
  final DatabaseService _databaseService;

  MessageLocalDataSourceImpl(this._databaseService);

  @override
  Future<MessageCategoryModel> getCategoryList() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('category');
    return MessageCategoryModel(
        categoryes:
            List<Categorye>.from(maps.map((map) => Categorye.fromJson(map))));
  }

  @override
  Future<MessagesModel> getMessagesList(String uid) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('message',
        where: 'senderUid = ? OR receiverUid = ?', whereArgs: [uid, uid]);

    return MessagesModel(
        messages: List<Message>.from(maps.map((map) => Message.fromJson(map))));
  }

  @override
  Future<MessagesModel> sendMessage(String uid, String message) async {
    final db = await _databaseService.database;
    final currentTime = DateTime.now()
            .subtract(const Duration(hours: 1))
            .millisecondsSinceEpoch ~/
        1000;
    final messageData = Message(
        data: message,
        dataTime: currentTime,
        uid: 'me',
        senderUid: uid,
        receiverUid: 'me');

    await db.insert('message', messageData.toJson());

    updateCategoryLastMessage(uid, message, currentTime, 1);

    // Получаем обновленный список сообщений после вставки нового
    final List<Map<String, dynamic>> maps = await db.query('message',
        where: 'senderUid = ? OR receiverUid = ?', whereArgs: [uid, uid]);

    return MessagesModel(
        messages: List<Message>.from(maps.map((map) => Message.fromJson(map))));
  }

  Future<void> updateCategoryLastMessage(String partnerUid, String lastMessage,
      int lastMessageDate, int lastMessageByMe) async {
    final db = await _databaseService.database;
    // Получаем текущую информацию о категории
    final currentCategory = await getCategoryByUid(partnerUid);

    // Обновляем данные о последнем сообщении
    final Categorye updatedCategory = Categorye(
        firstname: currentCategory?.firstname,
        lastname: currentCategory?.lastname,
        uid: currentCategory?.uid,
        lastMessage: lastMessage,
        lastMessageDate: lastMessageDate,
        lastMessageByMe: lastMessageByMe);

    await db.update(
      'category',
      updatedCategory.toJson(),
      where: 'uid = ?',
      whereArgs: [partnerUid],
    );
  }

  Future<Categorye?> getCategoryByUid(String uid) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('category', where: 'uid = ?', whereArgs: [uid]);

    if (maps.isNotEmpty) {
      // Если найдены данные, возвращаем экземпляр Categorye
      return Categorye.fromJson(maps.first);
    } else {
      // Если ничего не найдено, возвращаем null
      return null;
    }
  }
}
