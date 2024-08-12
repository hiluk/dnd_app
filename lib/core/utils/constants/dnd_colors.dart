// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DndColors {
  final Color primary;
  final Color onPrimary;
  final Color background;

  DndColors({
    required this.primary,
    required this.onPrimary,
    required this.background,
  });

  const DndColors.dark({
    this.primary = const Color(0xFFD32430),
    this.background = const Color(0xff000000),
    this.onPrimary = const Color(0xFFE6ECEC),
  });

  const DndColors.light({
    this.primary = const Color(0xFFA29C9B),
    this.background = const Color(0xFFFFFFFF),
    this.onPrimary = const Color(0xFFFFFFFF),
  });
}
