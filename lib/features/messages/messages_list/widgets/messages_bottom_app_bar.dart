import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/features/messages/messages_list/bloc/messages_bloc.dart';

class MessagesBottomAppBar extends StatefulWidget {
  const MessagesBottomAppBar({super.key, required this.messagesBloc, required this.uid});
  final MessagesBloc messagesBloc;
  final String uid;

  @override
  State<MessagesBottomAppBar> createState() => _MessagesBottomAppBarState();
}

class _MessagesBottomAppBarState extends State<MessagesBottomAppBar> {
  final TextEditingController _controller = TextEditingController();
  bool canSend = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColors.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                    color: MColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: MColors.iconColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: MColors.iconColor, width: 1),
                      color: MColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          TextField(
                            style: MTextStyles.messageTextStyle,
                            controller: _controller,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              if (value.isNotEmpty && !canSend) {
                                setState(() {
                                  canSend = true;
                                });
                              } else if (value.isEmpty) {
                                setState(() {
                                  canSend = false;
                                });
                              }
                            },
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              hintText: 'Сообщение...',
                              hintStyle: MTextStyles.thirdTextStyle,
                              border: InputBorder.none,
                              labelStyle: MTextStyles.leadingTextStyle,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/svg/face.svg')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    if (canSend) {
                      widget.messagesBloc.add(MessagesSendEvent(uid: widget.uid, message: _controller.text));
                      _controller.clear();
                      setState(() {
                        _controller.clear();
                        canSend = false;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: canSend ? MColors.greenColor : MColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: canSend
                          ? const Icon(
                              Icons.send_rounded,
                              color: MColors.purpleColor,
                            )
                          : const Icon(
                              Icons.mic_none,
                              color: MColors.iconColor,
                            ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
