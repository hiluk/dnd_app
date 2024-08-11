import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/theme_mode_cubit.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/ui_kit/dnd_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await configureDependencies();
  await di.allReady();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.get<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.get<ThemeModeCubit>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeModeCubit>();
    print(themeMode.state.name);
    final router = di.get<GoRouter>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        router.refresh();
      },
      child: MaterialApp.router(
        theme: di.get<DndTheme>().fromMode(themeMode.state.name),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
