import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/core/widgets/message_container_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/features/messages/messages_list/bloc/messages_bloc.dart';
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
  final _messagesBloc = getIt<MessagesBloc>();

  @override
  Widget build(BuildContext context) {
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
              BlocProvider(
                create: (context) => _messagesBloc
                  ..add(
                    MessagesStartEvent(uid: widget.categorye.uid ?? ''),
                  ),
                child: BlocBuilder<MessagesBloc, MessagesState>(
                    builder: (context, state) => state is MessagesLoadedState
                        ? ListView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                            itemCount: state.messagesList.messages?.length,
                            reverse: true,
                            itemBuilder: (context, index) =>
                                MessageContainerWidget(
                              message: state.messagesList.messages?[
                                      ((state.messagesList.messages?.length ??
                                                  0) -
                                              1) -
                                          index] ??
                                  Message(),
                            ),
                          )
                        : state is MessagesErrorState
                            ? const Center(
                                child: Text(
                                  "Произошла ошибка, повторите попытку позже",
                                  style: MTextStyles.primaryTextStyle,
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              )),
              ),
              MessagesBottomAppBar(
                messagesBloc: _messagesBloc,
                uid: widget.categorye.uid ?? '',
              ),
            ],
          ),
        ));
  }
}
