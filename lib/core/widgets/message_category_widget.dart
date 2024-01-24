import 'package:flutter/material.dart';
import 'package:messager/core/utils/date_time_formater.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/features/messages/messages_list/messages_view.dart';

class MessageCategoryWidget extends StatelessWidget {
  const MessageCategoryWidget({super.key, required this.categorye});
  final Categorye categorye;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MessagesView(categorye: categorye)));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: MColors.orangeLiniarGradient,
                        borderRadius: BorderRadius.circular(66),
                      ),
                      child: Center(
                        child: Text(
                          '${categorye.firstname?[0]}${categorye.lastname?[0]}',
                          style: MTextStyles.whiteLeadingTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${categorye.firstname} ${categorye.lastname}",
                          style: MTextStyles.primaryTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            categorye.lastMessageByMe ?? false
                                ? const Text(
                                    "Вы: ",
                                    style: MTextStyles.thirdTextStyle,
                                  )
                                : const SizedBox(),
                            Text(
                              categorye.lastMessage ?? '',
                              style: MTextStyles.secondaryTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
                categorye.lastMessageDate != null
                    ? Text(
                        formatDateTime(categorye.lastMessageDate ?? 1600000),
                        style: MTextStyles.secondaryTextStyle,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Container(
            height: 1,
            color: MColors.primaryColor,
          )
        ],
      ),
    );
  }
}
