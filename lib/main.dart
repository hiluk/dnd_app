import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/core/di/di.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerDependencies();
  await locator.allReady();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: locator.get<ThemeData>(),
      debugShowCheckedModeBanner: false,
      routerConfig: locator.get<GoRouter>(),
    );
  }
}
