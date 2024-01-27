part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryStartEvent extends CategoryEvent {}

class CategorySearchEvent extends CategoryEvent {
  final String params;
  CategorySearchEvent({required this.params});
}

class CategoryRefreshEvent extends CategoryEvent {}
