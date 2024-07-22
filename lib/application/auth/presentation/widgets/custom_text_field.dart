import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? callBack;
  final String? label;
  const CustomTextField({
    this.callBack,
    this.label,
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
      style: const TextStyle(color: Colors.black),
      controller: controller,
      onChanged: widget.callBack,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text(widget.label ?? ""),
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
}
