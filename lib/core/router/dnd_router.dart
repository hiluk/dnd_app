import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/presentation/login_screen.dart';
import 'package:flutter_application_1/application/auth/presentation/register_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_creation_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_screen.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_screen.dart';
import 'package:flutter_application_1/application/main_screen.dart';
import 'package:flutter_application_1/application/splash_screen.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DndRouter {
  static GoRouter getInstance(DataBase dataBase, {AuthState? authState}) {
    return GoRouter(
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
        GoRoute(
          path: MainScreen.routeLocation,
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: CharacterSelectionScreen.path,
              name: CharacterSelectionScreen.routeName,
              routes: [
                GoRoute(
                  path: CharacterCreationScreen.routePath,
                  name: CharacterCreationScreen.routePath,
                  builder: (context, state) => const CharacterCreationScreen(),
                ),
                GoRoute(
                  path: CharacterScreen.path,
                  name: CharacterScreen.routeName,
                  builder: (context, state) => const CharacterScreen(),
                )
              ],
              builder: (context, state) => const CharacterSelectionScreen(),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final inAuthScreens =
            state.uri.toString() == LoginScreen.routeLocation ||
                state.uri.toString() == '/login/register';

        return switch (authState) {
          Loading _ => null,
          Error _ => null,
          Logged _ => inAuthScreens ? MainScreen.routeLocation : null,
          NotLogged _ => inAuthScreens ? null : LoginScreen.routeLocation,
          _ => null,
        };
      },
    );
  }
}
