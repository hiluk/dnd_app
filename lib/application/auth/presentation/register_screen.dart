import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/models/register_request.dart';
import 'package:flutter_application_1/application/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/custom_button.dart';
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
    final isLoading = authBloc.state == const AuthState.loading();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => print("Ошибка 202"),
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SizedBox(
                height: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      label: "Email",
                      callBack: (text) => setState(() {
                        registerRequest = registerRequest.copyWith(email: text);
                      }),
                    ),
                    CustomTextField(
                      label: "Логин",
                      callBack: (text) => setState(() {
                        registerRequest = registerRequest.copyWith(login: text);
                      }),
                    ),
                    CustomTextField(
                      label: "Пароль",
                      callBack: (text) => setState(() {
                        registerRequest =
                            registerRequest.copyWith(password: text);
                      }),
                    ),
                    CustomButton(
                      title: "Зарегистрироваться",
                      callBack: () => authBloc.add(
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
    registerRequest = RegisterRequest();
  }
}
