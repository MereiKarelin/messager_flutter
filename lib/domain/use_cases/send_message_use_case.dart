import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';

class SendMessageUseCaseParams {
  final String uid;
  final String message;
  SendMessageUseCaseParams({required this.uid, required this.message});
}

@lazySingleton
class SendMessageUseCase
    implements UseCase<MessagesModel, SendMessageUseCaseParams> {
  final MessageRepository repository;

  const SendMessageUseCase({
    required this.repository,
  });

  @override
  Future<MessagesModel> call(SendMessageUseCaseParams params) async {
    return await repository.sendMessage(params.uid, params.message);
  }
}
