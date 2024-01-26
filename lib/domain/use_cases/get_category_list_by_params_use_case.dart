import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/domain/repository/messages_repository.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';

class GetCategoryListByParamsUseCaseParams {
  final String params;
  GetCategoryListByParamsUseCaseParams({required this.params});
}

@lazySingleton
class GetCategoryListByParamsUseCase
    implements
        UseCase<MessageCategoryModel, GetCategoryListByParamsUseCaseParams> {
  final MessageRepository repository;

  const GetCategoryListByParamsUseCase({
    required this.repository,
  });

  @override
  Future<MessageCategoryModel> call(
      GetCategoryListByParamsUseCaseParams params) async {
    return await repository.getCategoryListByParams(params.params);
  }
}
