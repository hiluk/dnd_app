import 'package:flutter/material.dart';
import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
import 'package:dnd_app/application/auth/presentation/auth_layout.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_button.dart';
import 'package:dnd_app/core/ui_kit/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';
  static const routeLocation = 'register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterRequest registerRequest;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final isLoading = authBloc.state is AuthLoading;

    return AuthLayout(
      title: 'Регистрация',
      subtitle: 'Аккаунт хранит ваших персонажей',
      showBack: true,
      children: [
        CustomTextField(
          label: 'Эмейл',
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          onChanged: (text) => setState(() {
            registerRequest = registerRequest.copyWith(email: text);
          }),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Логин',
          autofillHints: const [AutofillHints.newUsername],
          textInputAction: TextInputAction.next,
          onChanged: (text) => setState(() {
            registerRequest = registerRequest.copyWith(login: text);
          }),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Пароль',
          obscureText: true,
          autofillHints: const [AutofillHints.newPassword],
          textInputAction: TextInputAction.done,
          onChanged: (text) => setState(() {
            registerRequest = registerRequest.copyWith(password: text);
          }),
        ),
        const SizedBox(height: 6),
        Text(
          'От 6 символов, с цифрой, строчной и заглавной буквами',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 28),
        CustomButton(
          title: 'Зарегистрироваться',
          onTap: () => authBloc.add(AuthEvent.register(registerRequest)),
          isLoading: isLoading,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    registerRequest = const RegisterRequest();
  }
}
