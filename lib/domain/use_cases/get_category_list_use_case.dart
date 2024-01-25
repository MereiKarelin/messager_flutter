import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';

@lazySingleton
class GetCategoryListUseCase
    implements UseCase<MessageCategoryModel, NoParams> {
  final MessageRepository repository;

  const GetCategoryListUseCase({
    required this.repository,
  });

  @override
  Future<MessageCategoryModel> call(NoParams params) async {
    return await repository.getCategoryList();
  }
}
