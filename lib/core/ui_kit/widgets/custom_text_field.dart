import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/ui_kit/color_scheme.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? label;
  final bool autoFocus;
  const CustomTextField({
    this.onChanged,
    this.label,
    this.autoFocus = false,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFocus,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      onChanged: widget.onChanged,
      cursorColor: DndColors.primary,
      decoration: InputDecoration(
        focusColor: DndColors.primary,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: DndColors.primary,
        )),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text(widget.label ?? ""),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
}
