import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';

class ButtonLogoutWidget extends StatelessWidget {
  const ButtonLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: () => _signOut(context),
        minTileHeight: 50,
        leading: const Icon(Iconsax.logout_1, size: 18),
        title: Text("log_out".tr),
      ),
    );
  }

  void _signOut(BuildContext context) {
    showDialog(
        context: context,
        builder: (cxt) => MessageBoxDialogWidget(
              message: "want_to_logout".tr,
              onAccenpt: () {
                Get.back();
                context.read<ProfileBloc>().add(const LogoutProfileEvent());
              },
            ));
  }
}
