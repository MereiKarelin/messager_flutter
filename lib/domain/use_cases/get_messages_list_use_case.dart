import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/messages_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';

@lazySingleton
class GetMessagesListUseCase implements UseCase<MessagesModel, NoParams> {
  final MessageRepository repository;

  const GetMessagesListUseCase({
    required this.repository,
  });

  @override
  Future<MessagesModel> call(NoParams params) async {
    return await repository.getMessagesList();
  }
}
