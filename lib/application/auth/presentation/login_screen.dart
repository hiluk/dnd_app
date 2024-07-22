import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/auth/models/login_request.dart';
import 'package:flutter_application_1/core/ui_kit/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_text_field.dart';

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
    print(loginRequest.login);
    print(loginRequest.password);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    label: "Логин",
                    callBack: (text) => setState(() {
                      loginRequest = loginRequest.copyWith(login: text);
                    }),
                  ),
                  CustomTextField(
                    label: "Пароль",
                    callBack: (text) => setState(() {
                      loginRequest = loginRequest.copyWith(password: text);
                    }),
                  ),
                  CustomButton(
                    title: "Войти",
                    callBack: () => authBloc.add(AuthEvent.login(loginRequest)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequest = LoginRequest(login: "", password: "");
  }
}
