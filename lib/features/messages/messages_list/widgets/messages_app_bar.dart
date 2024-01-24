import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';

class MessagesAppBar {
  static PreferredSize getAppBar(
      {required String firstname,
      required String lastname,
      required BuildContext context}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.left_chevron,
                      color: MColors.primaryTextColor,
                    )),
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
                          '${firstname[0]}${lastname[0]}',
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
                          "${firstname} ${lastname}",
                          style: MTextStyles.primaryTextStyle,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          'В сети',
                          style: MTextStyles.secondaryTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
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
