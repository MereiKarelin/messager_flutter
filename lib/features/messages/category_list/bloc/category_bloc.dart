import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/domain/use_cases/base_use_case.dart';
import 'package:messager/domain/use_cases/get_category_list_use_case.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoryListUseCase getCategoryListUseCase;
  CategoryBloc({required this.getCategoryListUseCase})
      : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryStartEvent) {
        emit(CategoryLoadingState());
        try {
          final categoryList = await getCategoryListUseCase(NoParams());
          emit(CategoryLoadedState(categoryList: categoryList));
        } catch (err) {
          emit(CategoryErrorState(error: err.toString()));
        }
      } else if (event is CategorySearchEvent) {}
    });
  }
}
