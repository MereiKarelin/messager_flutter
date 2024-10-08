import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_colors.dart';
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
  const MessagesView({super.key, required this.categorye, required this.index});
  final Categorye categorye;
  final int index;

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
        backgroundColor: MColors.primaryBackgroudColor,
        extendBodyBehindAppBar: true,
        appBar: MessagesAppBar.getAppBar(
            firstname: widget.categorye.firstname ?? '', lastname: widget.categorye.lastname ?? '', context: context, index: widget.index),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                  child: Center(
                      child: Container(
                          height: 35,
                          color: MColors.purpleColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Image(image: AssetImage('assets/icons/rocket.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2 общих соблазна',
                                  style: MTextStyles.cursiveTextStyle,
                                ),
                              ],
                            ),
                          ))),
                ),
                Material(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: MColors.secondaryPrimaryColor),
                            color: MColors.backgroundColor,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9))),
                        height: MediaQuery.of(context).size.height / 1.15,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 3, left: 2, right: 2, bottom: 100),
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
                                              itemBuilder: (context, index) => MessageContainerWidget(
                                                message: state.messagesList.messages?[((state.messagesList.messages?.length ?? 0) - 1) - index] ?? Message(),
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
                            )))),
              ]),
            ),
          ),
        ));
  }
}
