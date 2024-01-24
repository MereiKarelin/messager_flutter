import 'package:flutter/material.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/core/widgets/category_search_widget.dart';
import 'package:messager/core/widgets/message_category_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';

class CategoryView extends StatelessWidget implements Navigable {
  CategoryView({super.key});

  final MessageCategoryModel messageCategoryModel = MessageCategoryModel(
    categoryes: [
      Categorye(
        uid: "example_uid1",
        firstname: "John",
        lastname: "Doe",
        lastMessage: "Hello, how are you?",
        lastMessageDate: 1643084400,
        lastMessageByMe: true,
      ),
      Categorye(
        uid: "example_uid2",
        firstname: "Jane",
        lastname: "Doe",
        lastMessage: "Hi there!",
        lastMessageDate: 1643084500,
        lastMessageByMe: false,
      ),
      Categorye(
        uid: "example_uid3",
        firstname: "Alice",
        lastname: "Smith",
        lastMessage: "Good to see you!",
        lastMessageDate: 1643084600,
        lastMessageByMe: true,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Чаты",
                style: MTextStyles.leadingTextStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: CategorySearchWidget(),
            ),
            Container(
              height: 1,
              color: MColors.primaryColor,
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        itemCount: messageCategoryModel.categoryes?.length,
        itemBuilder: (context, index) {
          return MessageCategoryWidget(
              categorye:
                  messageCategoryModel.categoryes?[index] ?? Categorye());
        },
      ),
    );
  }

  @override
  String getName() => Routes.messageCategoryes;
}
