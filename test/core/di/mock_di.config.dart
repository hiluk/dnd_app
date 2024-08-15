// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart'
    as _i103;
import 'package:flutter_application_1/core/api/classes/models/class_model.dart'
    as _i1053;
import 'package:flutter_application_1/core/api/races/models/race_model.dart'
    as _i314;
import 'package:flutter_application_1/core/http_client/interfaces/i_http_client.dart'
    as _i121;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../application/character/repositories/mock_characters_repository.dart'
    as _i278;
import '../http_client/mock_http_client.dart' as _i449;
import 'modules/mock_core_module.dart' as _i931;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> mockInit({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.factory<_i361.Dio>(() => coreModule.dio);
    gh.factory<List<_i1053.Class>>(() => coreModule.classes);
    gh.factory<List<_i314.Race>>(() => coreModule.races);
    gh.singleton<_i583.GoRouter>(() => coreModule.router);
    gh.factory<_i103.CharactersRepository>(
        () => _i278.MockCharacterRepository());
    gh.factory<_i121.IHttpClient>(() => _i449.MockHttpClient());
    return this;
  }
}

class _$CoreModule extends _i931.CoreModule {}
