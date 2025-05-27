import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.onFieldSubmitted,
  });
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: Icon(Iconsax.search_normal_1_copy),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        counterText: "",
      ),
    );
  }
}
