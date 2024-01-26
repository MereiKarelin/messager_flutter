// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:messager/core/utils/database_service.dart' as _i3;
import 'package:messager/core/utils/database_service_impl.dart' as _i4;
import 'package:messager/data/datasource/local_datasource/messages_local_datasource.dart'
    as _i5;
import 'package:messager/data/repository/messages_repository_impl.dart' as _i7;
import 'package:messager/domain/repository/messages_repository.dart' as _i6;
import 'package:messager/domain/use_cases/get_category_list_use_case.dart'
    as _i9;
import 'package:messager/domain/use_cases/get_messages_list_use_case.dart'
    as _i10;
import 'package:messager/domain/use_cases/send_message_use_case.dart' as _i8;
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart'
    as _i12;
import 'package:messager/features/messages/messages_list/bloc/messages_bloc.dart'
    as _i11;

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
  gh.lazySingleton<_i3.DatabaseService>(() => _i4.DatabaseServiceImpl());
  gh.lazySingleton<_i5.MessageLocalDataSource>(
      () => _i5.MessageLocalDataSourceImpl(gh<_i3.DatabaseService>()));
  gh.lazySingleton<_i6.MessageRepository>(() => _i7.MessageRepositoryImpl(
      messageLocalDataSource: gh<_i5.MessageLocalDataSource>()));
  gh.lazySingleton<_i8.SendMessageUseCase>(
      () => _i8.SendMessageUseCase(repository: gh<_i6.MessageRepository>()));
  gh.lazySingleton<_i9.GetCategoryListUseCase>(() =>
      _i9.GetCategoryListUseCase(repository: gh<_i6.MessageRepository>()));
  gh.lazySingleton<_i10.GetMessagesListUseCase>(() =>
      _i10.GetMessagesListUseCase(repository: gh<_i6.MessageRepository>()));
  gh.factory<_i11.MessagesBloc>(() => _i11.MessagesBloc(
        getMessagesListUseCase: gh<_i10.GetMessagesListUseCase>(),
        sendMessageUseCase: gh<_i8.SendMessageUseCase>(),
      ));
  gh.factory<_i12.CategoryBloc>(() => _i12.CategoryBloc(
      getCategoryListUseCase: gh<_i9.GetCategoryListUseCase>()));
  return get;
}
