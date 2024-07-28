import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_1/application/character/presentation/character_selection_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  static const routeName = ' ';
  static const routeLocation = '/';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () => authBloc.add(const AuthEvent.signOut()),
                icon: const Icon(Icons.exit_to_app),
              ),
              actions: [
                IconButton(
                  onPressed: () =>
                      context.pushNamed(CharacterSelectionScreen.routeName),
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
