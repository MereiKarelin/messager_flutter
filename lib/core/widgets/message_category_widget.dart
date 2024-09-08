import 'package:flutter/material.dart';
import 'package:messager/core/utils/date_time_formater.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart';
import 'package:messager/features/messages/messages_list/messages_view.dart';

class MessageCategoryWidget extends StatelessWidget {
  const MessageCategoryWidget({super.key, required this.categorye, required this.categoryBloc, required this.index});
  final Categorye categorye;
  final CategoryBloc categoryBloc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesView(categorye: categorye, index: index)));
        categoryBloc.add(CategoryRefreshEvent());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 33, backgroundImage: AssetImage('assets/profiles/$index.jpg')),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        categorye.lastMessageDate != null
                            ? Text(
                                formatDateTime(categorye.lastMessageDate ?? 1600000),
                                style: MTextStyles.thirdTextStyle,
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            categorye.lastMessageByMe == 1
                                ? const Text(
                                    "Вы: ",
                                    style: MTextStyles.secondaryTextStyle,
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
