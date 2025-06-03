import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.onTap,
    this.isReadOnly = false,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int maxLines;
  final VoidCallback? onTap;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        counterText: "",
      ),
    );
  }
}
