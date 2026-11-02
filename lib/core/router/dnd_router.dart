import 'package:flutter/material.dart';
import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/auth/presentation/login_screen.dart';
import 'package:dnd_app/application/auth/presentation/register_screen.dart';
import 'package:dnd_app/application/character/bloc/characters/characters_bloc.dart';
import 'package:dnd_app/application/character/presentation/character_screen.dart';
import 'package:dnd_app/application/character/presentation/character_selection_screen.dart';
import 'package:dnd_app/application/character/repositories/characters_repository.dart';
import 'package:dnd_app/application/character_creating/bloc/assignment_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/background_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/skill_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/bonus_choice_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/character_creation_bloc.dart';
import 'package:dnd_app/application/character_creating/bloc/class_cubit.dart';
import 'package:dnd_app/application/character_creating/bloc/race_cubit.dart';
import 'package:dnd_app/application/character_creating/presentation/character_creation_screen.dart';
import 'package:dnd_app/application/main_screen.dart';
import 'package:dnd_app/application/splash_screen.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: SplashScreen.routeLocation,
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeLocation,
          name: LoginScreen.routeName,
          routes: [
            GoRoute(
              path: RegisterScreen.routeLocation,
              name: RegisterScreen.routeName,
              builder: (context, state) => const RegisterScreen(),
            )
          ],
          builder: (context, state) => const LoginScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider<CharactersBloc>(
              create: (context) => CharactersBloc(
                charactersRepository: di.get<CharactersRepository>(),
                logger: di.get<Logger>(),
              ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: MainScreen.routeLocation,
              name: MainScreen.routeName,
              builder: (context, state) => const MainScreen(),
            ),
            GoRoute(
              path: CharacterSelectionScreen.path,
              name: CharacterSelectionScreen.routeName,
              builder: (context, state) => const CharacterSelectionScreen(),
            ),
            GoRoute(
              path: CharacterCreationScreen.routePath,
              name: CharacterCreationScreen.routeName,
              // Состояние мастера создания живёт только пока открыт экран
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => CharacterCreationBloc(
                      di.get<CharactersRepository>(),
                      di.get<Logger>(),
                    ),
                  ),
                  BlocProvider(create: (context) => RaceCubit()),
                  BlocProvider(create: (context) => ClassCubit()),
                  BlocProvider(
                    create: (context) =>
                        AssignmentCubit(di.get<CharactersRepository>()),
                  ),
                  BlocProvider(create: (context) => BonusChoiceCubit()),
                  BlocProvider(create: (context) => BackgroundCubit()),
                  BlocProvider(create: (context) => SkillChoiceCubit()),
                ],
                child: const CharacterCreationScreen(),
              ),
            ),
            GoRoute(
              path: CharacterScreen.path,
              name: CharacterScreen.routeName,
              builder: (context, state) => CharacterScreen(
                characterId: state.extra! as String,
              ),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final inAuthScreens =
            state.matchedLocation.startsWith(LoginScreen.routeLocation);

        return switch (authState) {
          AuthLoading _ => null,
          AuthError _ => null,
          AuthLogged _ => inAuthScreens ? MainScreen.routeLocation : null,
          AuthNotLogged _ => inAuthScreens ? null : LoginScreen.routeLocation,
          _ => null,
        };
      },
    );
  }
}
