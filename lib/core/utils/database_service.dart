import 'package:messager/data/model/response/category_response_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<Database> get database;

  Future<Database> initialize();

  Future<void> create(Database database, int version);

  Future<void> insertInitialData(
      Database database, MessageCategoryModel initialData);

  void upgrade(Database database, int oldVersion, int newVersion);
}
