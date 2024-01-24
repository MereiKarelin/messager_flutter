import 'package:flutter/material.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/data/model/response/category_response_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessagesAppBar.getAppBar(
          firstname: widget.categorye.firstname ?? '',
          lastname: widget.categorye.lastname ?? '',
          context: context),
      bottomNavigationBar: const MessagesBottomAppBar(),
    );
  }
}
