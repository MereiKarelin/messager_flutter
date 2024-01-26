import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';

abstract class MessageLocalDataSource {
  Future<MessageCategoryModel> getCategoryList();
  Future<MessagesModel> getMessagesList();
}

@LazySingleton(as: MessageLocalDataSource)
class MessageLocalDataSourceImpl implements MessageLocalDataSource {
  @override
  Future<MessageCategoryModel> getCategoryList() async {
    final MessageCategoryModel messageCategoryModel = MessageCategoryModel(
      categoryes: [
        Categorye(
          uid: "example_uid1",
          firstname: "Merei",
          lastname: "Karelin",
          lastMessage: "Hello, how are you?",
          lastMessageDate: 1643084400,
          lastMessageByMe: true,
        ),
        Categorye(
          uid: "example_uid2",
          firstname: "Jane",
          lastname: "Doe",
          lastMessage: "Hi there!",
          lastMessageDate: 1643084500,
          lastMessageByMe: false,
        ),
        Categorye(
          uid: "example_uid3",
          firstname: "Alice",
          lastname: "Smith",
          lastMessage: "Good to see you!",
          lastMessageDate: 1643084600,
          lastMessageByMe: true,
        ),
      ],
    );

    return messageCategoryModel;
  }

  Future<MessagesModel> getMessagesList() async {
    const String jsonString = '''
  {
    "messages": [
      {
        "data": "Привет! как ты?",
        "dataTime": 1643084400,
        "uid": "user1"
      },
      {
        "data": "Нормально",
        "dataTime": 1643084500,
        "uid": "me"
      },
      {
        "data": "Я в своем познании настолько преисполнился, что я как будто бы уже сто триллионов миллиардов лет проживаю на триллионах и триллионах таких же планет, как эта Земля, мне этот мир абсолютно понятен, и я здесь ищу только одного - покоя, умиротворения и вот этой гармонии, от слияния с бесконечно вечным, от созерцания великого фрактального подобия и от вот этого замечательного всеединства существа, бесконечно вечного, куда ни посмотри, хоть вглубь - бесконечно малое, хоть ввысь - бесконечное большое, понимаешь?",
        "dataTime": 1643084600,
        "uid": "user1"
      }
    ]
  }
  ''';

    return MessagesModel.fromJson(jsonDecode(jsonString));
  }
}
