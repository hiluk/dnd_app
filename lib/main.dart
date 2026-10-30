import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/core/di/di.dart';
import 'package:dnd_app/core/prefs/interfaces/i_tokens_database.dart';
import 'package:dnd_app/core/ui_kit/bloc/theme_mode_cubit.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await di.get<ITokensDatabase>().load();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    di.get<Logger>().w("Flutter error: $details");
  };
  WidgetsBinding.instance.platformDispatcher.onError = (e, st) {
    di.get<Logger>().e("Platform error", error: e, stackTrace: st);
    return true;
  };

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.get<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.get<ModeTypeCubit>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ModeTypeCubit>();
    final router = di.get<GoRouter>();
    final theme = di.get<DndTheme>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        router.refresh();
      },
      child: MaterialApp.router(
        title: 'DnD',
        theme: themeMode.isDark ? theme.dark : theme.light,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
