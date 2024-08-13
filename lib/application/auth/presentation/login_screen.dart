import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/application/auth/presentation/register_screen.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui_kit/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  static const routeLocation = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginRequest loginRequest;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final isLoading = authBloc.state is AuthLoading;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            ),
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      label: "Логин",
                      onChanged: (text) => setState(() {
                        loginRequest = loginRequest.copyWith(login: text);
                      }),
                    ),
                    CustomTextField(
                      label: "Пароль",
                      onChanged: (text) => setState(() {
                        loginRequest = loginRequest.copyWith(password: text);
                      }),
                    ),
                    CustomButton(
                      title: "Войти",
                      onTap: () => authBloc.add(AuthEvent.login(loginRequest)),
                      isLoading: isLoading,
                    ),
                    TextButton(
                      onPressed: () =>
                          context.pushNamed(RegisterScreen.routeName),
                      child: const Text(
                        "Зарегистрироваться",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loginRequest = const LoginRequest();
  }
}
