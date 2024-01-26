// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:messager/data/datasource/local_datasource/messages_local_datasource.dart'
    as _i3;
import 'package:messager/data/repository/messages_repository_impl.dart' as _i5;
import 'package:messager/domain/repository/messages_repository.dart' as _i4;
import 'package:messager/domain/use_cases/get_category_list_use_case.dart'
    as _i6;
import 'package:messager/domain/use_cases/get_messages_list_use_case.dart'
    as _i7;
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart'
    as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.MessageLocalDataSource>(
      () => _i3.MessageLocalDataSourceImpl());
  gh.lazySingleton<_i4.MessageRepository>(() => _i5.MessageRepositoryImpl(
      messageLocalDataSource: gh<_i3.MessageLocalDataSource>()));
  gh.lazySingleton<_i6.GetCategoryListUseCase>(() =>
      _i6.GetCategoryListUseCase(repository: gh<_i4.MessageRepository>()));
  gh.lazySingleton<_i7.GetMessagesListUseCase>(() =>
      _i7.GetMessagesListUseCase(repository: gh<_i4.MessageRepository>()));
  gh.factory<_i8.CategoryBloc>(() => _i8.CategoryBloc(
      getCategoryListUseCase: gh<_i6.GetCategoryListUseCase>()));
  return get;
}
