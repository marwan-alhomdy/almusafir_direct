import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/handler/handler.dart';

class DatePickerFieldWidget extends StatelessWidget {
  const DatePickerFieldWidget({
    super.key,
    required this.name,
    this.validator,
    required this.controller,
    this.padding = 20,
  });
  final String name;
  final double padding;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: true,
      onTap: () => _onChoseDateTime(context, controller.text),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        suffix: Icon(Iconsax.calendar),
        label: Text(name),
      ),
    );
  }

  void _onChoseDateTime(BuildContext context, String date) async {
    DateTime dateTime = DateTime.tryParse(date) ?? DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      controller.text = DateTimeHandler.formatDate(pickedDate);
    } else {}
  }
}
