import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  T? getTheme<T>() => Theme.of(this).extension<T>();
}
