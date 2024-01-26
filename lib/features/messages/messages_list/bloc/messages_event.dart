part of 'messages_bloc.dart';

@immutable
sealed class MessagesEvent {}

class MessagesStartEvent extends MessagesEvent {
  final String uid;
  MessagesStartEvent({required this.uid});
}

class MessagesSendEvent extends MessagesEvent {
  final String uid;
  final String message;
  MessagesSendEvent({
    required this.uid,
    required this.message,
  });
}
