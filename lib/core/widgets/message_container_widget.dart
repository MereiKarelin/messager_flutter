import 'package:flutter/material.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/data/model/response/messages_response_model.dart';

class MessageContainerWidget extends StatelessWidget {
  const MessageContainerWidget({super.key, required this.message});
  final Message message;
  final String myUid = 'me';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: message.uid == myUid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: message.uid == myUid
                    ? MColors.greenColor
                    : MColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: message.uid == myUid
                        ? const Radius.circular(16)
                        : const Radius.circular(0),
                    bottomRight: message.uid == myUid
                        ? const Radius.circular(0)
                        : const Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: message.data!.length > 35
                        ? MediaQuery.of(context).size.width / 1.3
                        : null,
                    child: Text(
                      softWrap: true,
                      message.data ?? '',
                      style: MTextStyles.messageTextStyle,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${DateTime.fromMillisecondsSinceEpoch(message.dataTime! * 1000).hour + 1}:${DateTime.fromMillisecondsSinceEpoch(message.dataTime! * 1000).minute}",
                        style: MTextStyles.thirdTextStyle.copyWith(fontSize: 9),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.check_sharp,
                        size: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
