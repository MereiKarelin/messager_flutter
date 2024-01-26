import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/features/messages/messages_list/bloc/messages_bloc.dart';

class MessagesBottomAppBar extends StatefulWidget {
  const MessagesBottomAppBar({super.key, required this.uid});
  final String uid;

  @override
  State<MessagesBottomAppBar> createState() => _MessagesBottomAppBarState();
}

class _MessagesBottomAppBarState extends State<MessagesBottomAppBar> {
  final _messagesBloc = getIt<MessagesBloc>();
  final TextEditingController _controller = TextEditingController();
  bool canSend = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: MColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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
                  child: Center(
                    child: SvgPicture.asset('assets/icons/svg/attach.svg'),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 47,
                    decoration: BoxDecoration(
                      color: MColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
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
                            hintText: 'Сообщение',
                            hintStyle: MTextStyles.grayTextStyle,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    if (canSend) {
                      _messagesBloc.add(MessagesSendEvent(
                          uid: widget.uid, message: _controller.text));
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color:
                          canSend ? MColors.greenColor : MColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: canSend
                          ? const Icon(Icons.send_rounded)
                          : SvgPicture.asset('assets/icons/svg/voice.svg'),
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
