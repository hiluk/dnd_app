// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../application/auth/bloc/auth_bloc.dart' as _i459;
import '../../application/auth/interfaces/i_token_repository.dart' as _i246;
import '../../application/auth/repositories/tokens_repository.dart' as _i498;
import '../../application/character/repositories/characters_repository.dart'
    as _i485;
import '../catalog/catalog_repository.dart' as _i906;
import '../http_client/http_client.dart' as _i747;
import '../http_client/interceptors/auth_interceptor.dart' as _i960;
import '../http_client/interceptors/logger_interceptor.dart' as _i710;
import '../http_client/interfaces/i_http_client.dart' as _i101;
import '../prefs/data_base.dart' as _i682;
import '../prefs/interfaces/i_tokens_database.dart' as _i953;
import '../ui_kit/bloc/theme_mode_cubit.dart' as _i761;
import '../ui_kit/dnd_theme.dart' as _i350;
import 'modules/core_module.dart' as _i134;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    gh.factory<_i350.DndTheme>(() => _i350.DndTheme());
    gh.singleton<_i583.GoRouter>(() => coreModule.router);
    gh.lazySingleton<_i974.Logger>(() => coreModule.logger);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => coreModule.secureStorage);
    gh.lazySingleton<_i953.ITokensDatabase>(() => _i682.DataBase(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i974.Logger>(),
        ));
    gh.lazySingleton<_i960.AuthInterceptor>(() => _i960.AuthInterceptor(
          gh<_i953.ITokensDatabase>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i761.ModeTypeCubit>(
        () => _i761.ModeTypeCubit(gh<_i974.Logger>()));
    gh.lazySingleton<_i710.LoggerInterceptor>(
        () => _i710.LoggerInterceptor(gh<_i974.Logger>()));
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio(
          gh<_i960.AuthInterceptor>(),
          gh<_i710.LoggerInterceptor>(),
        ));
    gh.lazySingleton<_i101.IHttpClient>(
        () => _i747.AppHttpClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i906.CatalogRepository>(
        () => _i906.CatalogRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i246.ITokensRepository>(() => _i498.TokensRepository(
          gh<_i101.IHttpClient>(),
          gh<_i953.ITokensDatabase>(),
        ));
    gh.factory<_i459.AuthBloc>(
        () => _i459.AuthBloc(gh<_i246.ITokensRepository>()));
    gh.factory<_i485.CharactersRepository>(() => _i485.CharactersRepository(
          gh<_i101.IHttpClient>(),
          gh<_i906.CatalogRepository>(),
          gh<_i974.Logger>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i134.CoreModule {}
