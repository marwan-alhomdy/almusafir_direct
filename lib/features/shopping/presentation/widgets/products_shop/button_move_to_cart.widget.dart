import 'package:almusafir_direct/core/utils/function/toast_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../cart/presentation/pages/cart.view.dart';
import '../../../../home/data/model/orderstypes/datum.dart';
import '../../logic/shop_cart_cubit/shop_cart_cubit.dart';

class ButtonMoveToCartWidget extends StatelessWidget {
  const ButtonMoveToCartWidget(
      {super.key, required this.shopId, required this.orderType});
  final OrderType? orderType;
  final int? shopId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCartCubit, ShopCartState>(
      listener: listenerShopCart,
      builder: (context, __) => context.read<ShopCartCubit>().rowCart.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => Get.to(
                      () => MyCartView(orderType: orderType, shopId: shopId)),
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text('الانتقال إلى السلة'),
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

  void listenerShopCart(BuildContext context, ShopCartState state) {
    if (state is ErrorFetchShopCartState) {
      ToastBox.showError(message: state.message);
    }
  }
}
