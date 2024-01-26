part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final MessageCategoryModel categoryList;
  CategoryLoadedState({required this.categoryList});
}

class CategoryErrorState extends CategoryState {
  final String error;
  CategoryErrorState({required this.error});
}
