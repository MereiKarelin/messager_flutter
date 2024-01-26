import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';

class GetMessagesListUseCaseParams {
  final String uid;
  GetMessagesListUseCaseParams({required this.uid});
}

@lazySingleton
class GetMessagesListUseCase
    implements UseCase<MessagesModel, GetMessagesListUseCaseParams> {
  final MessageRepository repository;

  const GetMessagesListUseCase({
    required this.repository,
  });

  @override
  Future<MessagesModel> call(GetMessagesListUseCaseParams params) async {
    return await repository.getMessagesList(params.uid);
  }
}
