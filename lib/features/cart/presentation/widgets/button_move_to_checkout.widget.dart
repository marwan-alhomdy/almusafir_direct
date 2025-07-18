import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as transition;
import 'package:get/get.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../../../helper/public_infromation.dart';
import '../../../auth/persention/view/auth_view.dart';
import '../../../checkout/presentation/pages/chekcout.view.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/cart_cubit/cart_cubit.dart';

class ButtonMoveToCheckoutWidget extends StatelessWidget {
  const ButtonMoveToCheckoutWidget(
      {super.key, required this.shopId, required this.orderType});
  final OrderType? orderType;
  final int? shopId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, __) => context.read<CartCubit>().rowCart.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => _moveToCheckout(context),
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text('اتمام الطلب'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainOneColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorderAttribute.all(12),
                  ),
                ),
              ),
            ),
    );
  }

  void _moveToCheckout(BuildContext context) {
    if (Helper.isAuth) {
      Get.to(() => CheckoutView(
          productsCart: context.read<CartCubit>().rowCart,
          orderType: orderType,
          shopId: shopId));
    } else {
      showDialog(
        context: context,
        builder: (cxt) => MessageBoxDialogWidget(
          message: "يجب عليك تسجيل الدخول ، هل تريد تسجيل الدخول ؟".tr,
          onAccenpt: () {
            Get.back();
            Get.to(() => const AuthView(),
                duration: const Duration(milliseconds: 600),
                transition: transition.Transition.downToUp,
                curve: Curves.easeInOutCubicEmphasized);
          },
        ),
      );
    }
  }
}
