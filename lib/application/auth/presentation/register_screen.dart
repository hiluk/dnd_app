import 'package:flutter/material.dart';
import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/application/auth/models/login_request.dart';
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

    return Scaffold(
      appBar: AppBar(),
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
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      onChanged: (text) => setState(() {
                        registerRequest = registerRequest.copyWith(email: text);
                      }),
                    ),
                    CustomTextField(
                      label: "Логин",
                      onChanged: (text) => setState(() {
                        registerRequest = registerRequest.copyWith(login: text);
                      }),
                    ),
                    CustomTextField(
                      label: "Пароль",
                      obscureText: true,
                      autofillHints: const [AutofillHints.newPassword],
                      onChanged: (text) => setState(() {
                        registerRequest =
                            registerRequest.copyWith(password: text);
                      }),
                    ),
                    Text(
                      "Пароль: от 6 символов, цифра, строчная и заглавная буквы",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomButton(
                      title: "Зарегистрироваться",
                      onTap: () => authBloc.add(
                        AuthEvent.register(registerRequest),
                      ),
                      isLoading: isLoading,
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
    registerRequest = const RegisterRequest();
  }
}
