part of 'messages_bloc.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}

class MessagesLoadingState extends MessagesState {}

class MessagesLoadedState extends MessagesState {
  final MessagesModel messagesList;
  final List<DateTimeModel> dateTimeModel;
  MessagesLoadedState(
      {required this.messagesList, required this.dateTimeModel});
}

class MessagesErrorState extends MessagesState {
  final String error;
  MessagesErrorState({required this.error});
}
