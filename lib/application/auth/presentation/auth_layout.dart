import 'package:dnd_app/application/auth/bloc/auth_bloc.dart';
import 'package:dnd_app/core/ui_kit/dnd_palette.dart';
import 'package:dnd_app/core/ui_kit/dnd_theme.dart';
import 'package:dnd_app/core/ui_kit/widgets/figure_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Общая раскладка входа и регистрации: дракон над заголовком, поля и кнопки.
/// Ошибки авторизации показываются внизу экрана.
class AuthLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final bool showBack;

  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    final p = DndPalette.of(context);

    return Scaffold(
      appBar: showBack ? AppBar() : null,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message))),
          );
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!showBack)
                        const SizedBox(
                          height: 170,
                          child: ArtImage(
                            CardArt.figure('${figuresDir}dragon.png'),
                          ),
                        ),
                      const SizedBox(height: 12),
                      Text(title, style: DndTheme.display(p.ink, size: 36)),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 16, color: p.muted),
                      ),
                      const SizedBox(height: 28),
                      ...children,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
