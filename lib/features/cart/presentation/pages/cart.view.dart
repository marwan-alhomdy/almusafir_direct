import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:almusafir_direct/features/cart/presentation/widgets/empty_cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '/injection_container.dart' as di;
import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/product_card_cubit/product_card_cubit.dart';
import '../widgets/button_move_to_checkout.widget.dart';
import '../widgets/card_product_cart.widget.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key, required this.shopId, required this.orderType});
  final OrderType? orderType;
  final int? shopId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<CartCubit>()
              ..setShopId(shopId)
              ..fetchCart()),
        BlocProvider(
            create: (_) => di.sl<ProductCardCubit>()..setShopId(shopId)),
      ],
      child: BlocListener<ProductCardCubit, ProductCardState>(
        listener: (context, state) {
          if (state is ChangeProductCartSuccessfullyState) {
            context.read<CartCubit>().refreshRowsInCart(state.rowCart);
          }
        },
        child: Scaffold(
          appBar: MyAppBarWithLogo(
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  tooltip: "Delete Cart".tr,
                  color: AppColors.redForeColor,
                  icon: const Icon(Iconsax.trash),
                  onPressed: () => _deleteCart(context),
                );
              }),
              const SizedBox(width: 20),
            ],
          ),
          bottomNavigationBar:
              ButtonMoveToCheckoutWidget(shopId: shopId, orderType: orderType),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is LoadingFetchCartState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorFetchCartState) {
                return ErrorCustomWidget(state.message,
                    onTap: () => context.read<CartCubit>().fetchCart());
              } else if (state is FetchCartSuccessfullyState) {
                final rows = context.read<CartCubit>().rowCart;
                return (rows.isEmpty)
                    ? const EmptyCartWidget()
                    : AnimationLimiterWidget(
                        children: List.generate(
                          rows.length,
                          (index) => CardProductCartWidget(
                            rowCart: rows[index],
                          ),
                        ),
                      );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  void _deleteCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Material(
        color: Colors.transparent,
        child: MessageBoxDialogWidget(
          message: "Are you sure you want to delete the cart?".tr,
          onAccenpt: () {
            context.read<CartCubit>().deleteCart();
            Get.back();
          },
        ),
      ),
    );
  }
}
