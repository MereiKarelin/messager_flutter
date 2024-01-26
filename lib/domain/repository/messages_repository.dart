import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';

abstract class MessageRepository {
  Future<MessageCategoryModel> getCategoryList();
  Future<MessagesModel> getMessagesList(String uid);
  Future<MessagesModel> sendMessage(String uid, String message);
  Future<MessageCategoryModel> getCategoryListByParams(String params);
}
