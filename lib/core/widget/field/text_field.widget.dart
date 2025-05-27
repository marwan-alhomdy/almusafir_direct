import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.validator,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        counterText: "",
      ),
    );
  }
}
