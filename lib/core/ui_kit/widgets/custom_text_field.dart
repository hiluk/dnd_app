import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? label;
  final String? hint;
  final bool autoFocus;
  final bool alwaysInFocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  const CustomTextField({
    this.onChanged,
    this.label,
    this.hint,
    this.autoFocus = false,
    this.alwaysInFocus = false,
    this.obscureText = false,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction,
    this.onSubmitted,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 2, bottom: 6),
            child: Text(widget.label!, style: theme.textTheme.titleSmall),
          ),
        TextField(
          focusNode: focusNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          autofillHints: widget.autofillHints,
          autocorrect: !widget.obscureText,
          enableSuggestions: !widget.obscureText,
          autofocus: widget.autoFocus,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.alwaysInFocus
              ? (value) {
                  focusNode.requestFocus();
                  widget.onSubmitted?.call(value);
                }
              : widget.onSubmitted,
          style: theme.textTheme.bodyLarge,
          controller: controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(hintText: widget.hint),
        ),
      ],
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
