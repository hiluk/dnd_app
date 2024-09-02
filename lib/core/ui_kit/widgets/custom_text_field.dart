import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? label;
  final bool autoFocus;
  final bool alwaysInFocus;
  const CustomTextField({
    this.onChanged,
    this.label,
    this.autoFocus = false,
    this.alwaysInFocus = false,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      focusNode: focusNode,
      autofocus: widget.autoFocus,
      onSubmitted: widget.alwaysInFocus
          ? (value) {
              focusNode.requestFocus();
            }
          : null,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      onChanged: widget.onChanged,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        focusColor: theme.primaryColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: theme.primaryColor,
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
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }
}
