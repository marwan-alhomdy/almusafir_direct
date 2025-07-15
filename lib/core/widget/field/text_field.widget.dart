import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.onTap,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int maxLines;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: isReadOnly,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        counterText: "",
      ),
    );
  }
}
