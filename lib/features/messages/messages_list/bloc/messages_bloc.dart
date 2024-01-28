import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:messager/core/utils/datetime_model.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/domain/use_cases/get_messages_list_use_case.dart';
import 'package:messager/domain/use_cases/send_message_use_case.dart';

part 'messages_event.dart';
part 'messages_state.dart';

@injectable
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  DateTime dateTime = DateTime.now();
  GetMessagesListUseCase getMessagesListUseCase;
  SendMessageUseCase sendMessageUseCase;
  MessagesBloc(
      {required this.getMessagesListUseCase, required this.sendMessageUseCase})
      : super(MessagesInitial()) {
    on<MessagesEvent>((event, emit) async {
      if (event is MessagesStartEvent) {
        emit(MessagesLoadingState());
        try {
          final messagesList = await getMessagesListUseCase(
              GetMessagesListUseCaseParams(uid: event.uid));
          //       for(Message message from messagesList.messages)
          //                       dateTime = messageDateTime;
          // emit(MessagesLoadedState(messagesList: messagesList));
        } catch (err) {
          emit(MessagesErrorState(error: err.toString()));
        }
      }
      if (event is MessagesSendEvent) {
        try {
          await sendMessageUseCase(
              SendMessageUseCaseParams(uid: event.uid, message: event.message));
          final messagesList = await getMessagesListUseCase(
              GetMessagesListUseCaseParams(uid: event.uid));
          // emit(MessagesLoadedState(messagesList: messagesList));
          // emit(MessagesLoadedState(messagesList: messagesList));
        } catch (err) {
          emit(MessagesErrorState(error: err.toString()));
        }
      }
    });
  }
}
