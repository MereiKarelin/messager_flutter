import 'package:flutter/material.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/core/widgets/message_container_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/features/messages/messages_list/widgets/messages_app_bar.dart';
import 'package:messager/features/messages/messages_list/widgets/messages_bottom_app_bar.dart';

class MessagesView extends StatefulWidget implements Navigable {
  const MessagesView({super.key, required this.categorye});
  final Categorye categorye;

  @override
  State<MessagesView> createState() => _MessagesViewState();

  @override
  String getName() => Routes.messages;
}

class _MessagesViewState extends State<MessagesView> {
  final String jsonString = '''
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

  @override
  Widget build(BuildContext context) {
    MessagesModel messagesModel = messagesModelFromJson(jsonString);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MessagesAppBar.getAppBar(
            firstname: widget.categorye.firstname ?? '',
            lastname: widget.categorye.lastname ?? '',
            context: context),
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messagesModel.messages?.length,
                itemBuilder: (context, index) => MessageContainerWidget(
                  message: messagesModel.messages?[index] ?? Message(),
                ),
              ),
              const MessagesBottomAppBar(),
            ],
          ),
        ));
  }
}
