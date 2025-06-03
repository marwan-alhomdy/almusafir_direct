import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';

class ButtonDeleteAccountWidget extends StatelessWidget {
  const ButtonDeleteAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () async {
          deleteAccount(context);
        },
        minTileHeight: 50,
        leading: const Icon(Iconsax.trash, size: 18),
        title: Text("Delete account".tr),
      ),
    );
  }

  void deleteAccount(BuildContext context) {
    showDialog(
        context: context,
        builder: (cxt) => MessageBoxDialogWidget(
              message: "Delete account title".tr,
              onAccenpt: () {
                Get.back();
                context.read<ProfileBloc>().add(const DeleteAccountEvent());
              },
            ));
  }
}
