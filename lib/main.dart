import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/bloc/main/main_screen.dart';
import 'package:flutter_application_1/application/core/ui_kit/color_scheme.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Vinque',
        colorScheme: const ColorScheme.dark().copyWith(
          background: DndColors.backround,
        ),
      ),
      child: CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
