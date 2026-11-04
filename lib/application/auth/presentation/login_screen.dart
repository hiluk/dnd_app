import 'package:flutter/material.dart';
import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/presentation/register_screen.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:dnd_app/application/auth/presentation/auth_layout.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_text_field.dart';

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

    return AuthLayout(
      title: 'Вход',
      subtitle: 'Ваши герои ждут',
      children: [
        CustomTextField(
          label: 'Логин или эмейл',
          autofillHints: const [AutofillHints.username],
          textInputAction: TextInputAction.next,
          onChanged: (text) => setState(() {
            loginRequest = loginRequest.copyWith(login: text);
          }),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Пароль',
          obscureText: true,
          autofillHints: const [AutofillHints.password],
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => authBloc.add(AuthEvent.login(loginRequest)),
          onChanged: (text) => setState(() {
            loginRequest = loginRequest.copyWith(password: text);
          }),
        ),
        const SizedBox(height: 28),
        CustomButton(
          title: 'Войти',
          onTap: () => authBloc.add(AuthEvent.login(loginRequest)),
          isLoading: isLoading,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => context.pushNamed(RegisterScreen.routeName),
          child: const Text('Создать аккаунт'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loginRequest = const LoginRequest();
  }
}
