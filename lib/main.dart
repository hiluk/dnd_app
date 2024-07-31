import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/repositories/tokens_repository.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/prefs/data_base.dart';
import 'package:flutter_application_1/core/router/dnd_router.dart';
import 'package:flutter_application_1/core/utils/extensions/hex_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await di.allReady();

  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            dataBase: di.get<DataBase>(),
            repository: di.get<TokensRepository>(),
          ),
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
    final router = di.get<DndRouter>().router;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        router.refresh();
      },
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'Vinque',
          colorScheme: ColorScheme.dark(
            onBackground: HexColor.fromHex('#FAFBFC'),
            background: HexColor.fromHex('#141414'),
            surface: HexColor.fromHex('#141414'),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
