// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../application/auth/bloc/auth_bloc.dart' as _i459;
import '../../application/auth/interfaces/i_token_repository.dart' as _i246;
import '../../application/auth/repositories/tokens_repository.dart' as _i498;
import '../../application/character/bloc/characters/characters_bloc.dart'
    as _i13;
import '../../application/character/bloc/current_character/currrent_character_bloc.dart'
    as _i235;
import '../../application/character/repositories/characters_repository.dart'
    as _i485;
import '../../application/character_creating/bloc/character_creation_bloc.dart'
    as _i405;
import '../api/armor/repositories/armor_repository.dart' as _i667;
import '../api/backgrounds/repositories/backgrounds_repository.dart' as _i609;
import '../api/classes/models/class_model.dart' as _i305;
import '../api/feats/repository/feats_repository.dart' as _i97;
import '../api/races/models/race_model.dart' as _i446;
import '../api/weapons/repository/weapons_repository.dart' as _i619;
import '../http_client/http_client.dart' as _i747;
import '../http_client/interceptors/auth_interceptor.dart' as _i960;
import '../http_client/interfaces/i_http_client.dart' as _i101;
import '../prefs/data_base.dart' as _i682;
import '../prefs/interfaces/i_tokens_database.dart' as _i953;
import '../ui_kit/bloc/theme_mode_cubit.dart' as _i761;
import '../ui_kit/dnd_theme.dart' as _i350;
import 'modules/core_module.dart' as _i134;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
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
    gh.factory<_i953.ITokensDatabase>(
        () => _i682.DataBase(gh<_i460.SharedPreferences>()));
    gh.factory<_i361.Dio>(() => coreModule.dio);
    gh.factory<_i101.IHttpClient>(() => _i747.AppHttpClient(gh<_i361.Dio>()));
    gh.factory<_i960.AuthInterceptor>(
        () => _i960.AuthInterceptor(dataBase: gh<_i953.ITokensDatabase>()));
    await gh.factoryAsync<List<_i305.Class>>(
      () => coreModule.classes,
      preResolve: true,
    );
    await gh.factoryAsync<List<_i446.Race>>(
      () => coreModule.races,
      preResolve: true,
    );
    gh.factory<_i761.ModeTypeCubit>(() => _i761.ModeTypeCubit());
    gh.factory<_i350.DndTheme>(() => _i350.DndTheme());
    gh.singleton<_i583.GoRouter>(() => coreModule.router);
    gh.factory<_i485.CharactersRepository>(
        () => _i485.CharactersRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i667.ArmorRepository>(
        () => _i667.ArmorRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i609.BackgroundsRepository>(
        () => _i609.BackgroundsRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i97.FeatsRepository>(
        () => _i97.FeatsRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i619.WeaponsRepository>(
        () => _i619.WeaponsRepository(gh<_i101.IHttpClient>()));
    gh.factory<_i235.CurrentCharacterBloc>(() => _i235.CurrentCharacterBloc(
          gh<_i485.CharactersRepository>(),
          gh<String>(),
        ));
    gh.factory<_i246.ITokensRepository>(() => _i498.TokensRepository(
          gh<_i101.IHttpClient>(),
          gh<_i953.ITokensDatabase>(),
        ));
    gh.factory<_i13.CharactersBloc>(() => _i13.CharactersBloc(
        charactersRepository: gh<_i485.CharactersRepository>()));
    gh.factory<_i405.CharacterCreationBloc>(() => _i405.CharacterCreationBloc(
        charactersRepository: gh<_i485.CharactersRepository>()));
    gh.factory<_i459.AuthBloc>(
        () => _i459.AuthBloc(gh<_i246.ITokensRepository>()));
    return this;
  }
}

class _$CoreModule extends _i134.CoreModule {}
