import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/core/widgets/category_search_widget.dart';
import 'package:messager/core/widgets/message_category_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:get_it/get_it.dart';
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart';

class CategoryView extends StatelessWidget implements Navigable {
  CategoryView({super.key});

  final _categoryBloc = getIt<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.backgroundColor,
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
        body: BlocProvider(
            create: (context) => _categoryBloc..add(CategoryStartEvent()),
            child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) => state is CategoryLoadedState
                    ? ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                        itemCount: state.categoryList.categoryes?.length,
                        itemBuilder: (context, index) {
                          return MessageCategoryWidget(
                              categorye:
                                  state.categoryList.categoryes?[index] ??
                                      Categorye());
                        },
                      )
                    : state is CategoryErrorState
                        ? const Center(
                            child: Text(
                              "Произошла ошибка, повторите попытку позже",
                              style: MTextStyles.leadingTextStyle,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))));
  }

  @override
  String getName() => Routes.messageCategoryes;
}
