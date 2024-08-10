import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/presentation/login_screen.dart';
import 'package:flutter_application_1/application/auth/presentation/register_screen.dart';
import 'package:flutter_application_1/application/character/bloc/characters/characters_bloc.dart';
import 'package:flutter_application_1/application/character_creating/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_screen.dart';
import 'package:flutter_application_1/application/character/repositories/characters_repository.dart';
import 'package:flutter_application_1/application/main_screen.dart';
import 'package:flutter_application_1/application/splash_screen.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            return MultiBlocProvider(
              providers: [
                BlocProvider<CharactersBloc>(
                  create: (context) => CharactersBloc(
                    charactersRepository: di.get<CharactersRepository>(),
                  ),
                ),
              ],
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
              builder: (context, state) => const CharacterCreationScreen(),
            ),
            GoRoute(
              path: CharacterScreen.path,
              name: CharacterScreen.routeName,
              builder: (context, state) => const CharacterScreen(),
            )
          ],
        ),
      ],
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final inAuthScreens =
            state.uri.toString() == LoginScreen.routeLocation ||
                state.uri.toString() == '/login/register';

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
