import 'package:injectable/injectable.dart';
import 'package:messager/data/datasource/local_datasource/messages_local_datasource.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';

@LazySingleton(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final MessageLocalDataSource messageLocalDataSource;

  const MessageRepositoryImpl({
    required this.messageLocalDataSource,
  });

  @override
  Future<MessageCategoryModel> getCategoryList() async =>
      await messageLocalDataSource.getCategoryList();

  @override
  Future<MessagesModel> getMessagesList(
    String uid,
  ) async =>
      await messageLocalDataSource.getMessagesList(uid);

  @override
  Future<MessagesModel> sendMessage(String uid, String message) async =>
      await messageLocalDataSource.sendMessage(uid, message);
}
