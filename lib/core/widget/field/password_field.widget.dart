import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.controller,
    this.validator,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      validator: widget.validator,
      obscureText: _showPassword,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        counterText: "",
        suffix: GestureDetector(
            onTap: () {
              _showPassword = !_showPassword;
              setState(() {});
            },
            child: Icon(
              _showPassword ? Iconsax.lock_copy : Iconsax.lock_slash_copy,
            )),
      ),
    );
  }
}
