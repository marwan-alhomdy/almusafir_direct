import 'package:flutter/material.dart';

class UsernameFieldWidget extends StatelessWidget {
  const UsernameFieldWidget({
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
      textAlign: TextAlign.left,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        counterText: "",
      ),
    );
  }
}
