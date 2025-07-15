import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../../core/utils/function/message_box.dart';
import '../../../../../injection_container.dart' as di;
import '../../bloc/contact_us_cubit/contact_us_cubit.dart';
import 'form.contactus.widget.dart';

class ButtonContactUsWidget extends StatefulWidget {
  const ButtonContactUsWidget({super.key});

  @override
  State<ButtonContactUsWidget> createState() => _ButtonContactUsWidgetState();
}

class _ButtonContactUsWidgetState extends State<ButtonContactUsWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _showFormContactUsWidget, icon: const Icon(Iconsax.message));
  }

  void _showFormContactUsWidget() {
    BottomSheetWidget.showIsScroll(BlocProvider(
        create: (context) => di.sl<ContactUsCubit>(),
        child: BlocListener<ContactUsCubit, ContactUsState>(
            listener: _listenerContactUs, child: const FormContactUsWidget())));
  }

  void _listenerContactUs(_, ContactUsState state) {
    if (state is ContactUsSuccessfulState) {
      Get.back();
      MessageBox.showSuccess(context, "The operation was successful".tr);
    } else if (state is ErrorContactUsState) {
      MessageBox.showError(context, state.message);
    }
  }
}
