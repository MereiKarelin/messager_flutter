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
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart';

class CategoryView extends StatelessWidget implements Navigable {
  CategoryView({super.key});

  @override
  String getName() => Routes.messageCategoryes;

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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: CategorySearchWidget(categoryBloc: _categoryBloc),
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
                    ? RefreshIndicator(
                        color: MColors.leagingTextColor,
                        backgroundColor: MColors.backgroundColor,
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                          itemCount: state.categoryList.categoryes?.length,
                          itemBuilder: (context, index) {
                            return MessageCategoryWidget(
                                categoryBloc: _categoryBloc,
                                categorye:
                                    state.categoryList.categoryes?[index] ??
                                        Categorye());
                          },
                        ),
                        onRefresh: () async {
                          _categoryBloc.add(CategoryStartEvent());
                        })
                    : state is CategoryErrorState
                        ? const Center(
                            child: Text(
                              "Произошла ошибка, повторите попытку позже",
                              style: MTextStyles.primaryTextStyle,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))));
  }
}
