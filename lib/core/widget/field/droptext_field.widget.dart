import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DropTextFieldWidget extends StatelessWidget {
  const DropTextFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.onTap,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          counterText: "",
          suffixIcon: Icon(Iconsax.arrow_down)),
    );
  }
}
