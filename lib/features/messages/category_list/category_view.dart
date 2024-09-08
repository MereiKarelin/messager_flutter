import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/m_text_styles.dart';
import 'package:messager/core/utils/route_settings.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/core/widgets/incognit_show_modal.dart';
import 'package:messager/core/widgets/likes_category_widget.dart';
import 'package:messager/core/widgets/message_category_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/features/app/app_screen.dart';
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart';

class CategoryView extends StatelessWidget implements Navigable {
  CategoryView({super.key});

  @override
  String getName() => Routes.messageCategoryes;

  final _categoryBloc = getIt<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: Scaffold(
            backgroundColor: MColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 9, right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ЧАТЫ",
                          style: MTextStyles.leadingTextStyle,
                        ),
                        InkWell(
                          onTap: () => Incognit.showBottomSheet(context),
                          child: Row(
                            children: [
                              const Text(
                                "OFF",
                                style: MTextStyles.whiteLeadingTextStyle,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MColors.secondaryPrimaryColor),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/svg/glasses.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
                                return index == 0
                                    ? Column(children: [
                                        const LikesCategoryWidget(),
                                        MessageCategoryWidget(
                                          categoryBloc: _categoryBloc,
                                          categorye: state.categoryList.categoryes?[index] ?? Categorye(),
                                          index: index,
                                        )
                                      ])
                                    : MessageCategoryWidget(
                                        categoryBloc: _categoryBloc,
                                        categorye: state.categoryList.categoryes?[index] ?? Categorye(),
                                        index: index,
                                      );
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
                              )))));
  }
}
