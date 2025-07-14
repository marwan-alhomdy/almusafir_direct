import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../checkout/presentation/pages/chekcout.view.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/cart_cubit/cart_cubit.dart';

class ButtonMoveToCheckoutWidget extends StatelessWidget {
  const ButtonMoveToCheckoutWidget({super.key, this.orderType});
  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, __) => context.read<CartCubit>().rowCart.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Get.to(() => CheckoutView(orderType: orderType)),
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text('اتمام الطلب'),
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
}
