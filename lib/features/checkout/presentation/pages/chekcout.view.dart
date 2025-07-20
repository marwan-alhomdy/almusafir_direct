import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/handler/navigator.handler.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../cart/data/models/row_cart.module.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/form_checkout_cubit/form_checkout_cubit.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';
import '../widgets/form_checkout_input.widget.dart';
import '../widgets/summery/porders_checkout.widget.dart';
import '../widgets/summery/summery_checkout.widget.dart';
import 'order_success.view.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView(
      {super.key,
      required this.shopId,
      required this.orderType,
      required this.productsCart});
  final List<RowCartModel> productsCart;
  final OrderType? orderType;
  final int? shopId;

  bool isCheckoutPay = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<FormCheckoutCubit>()
              ..setOrderType(orderType, shopId)
              ..step1Checkout()),
        BlocProvider(create: (_) => di.sl<FormServiceCubit>()),
      ],
      child: Scaffold(
        appBar: const MyAppBarWithLogo(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormCheckoutInputWidget(orderType: orderType),
                      if (productsCart.isNotEmpty) ...[
                        Text(
                          "Order Summary".tr,
                          style: AppTextStyles.getMediumStyle(),
                        ),
                        ProductsCheckoutWidget(productsCart: productsCart),
                        const SummeryCheckoutWidget(),
                      ]
                    ],
                  ),
                ),
              ),
              BlocListener<FormCheckoutCubit, FormCheckoutState>(
                listener: _listenerServicesCubit,
                child: Builder(builder: (context) {
                  return ButtonWidget(
                      text: "OK".tr,
                      onTap: () {
                        context.read<FormCheckoutCubit>().checkout2();
                        isCheckoutPay = true;
                      });
                }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _listenerServicesCubit(BuildContext context, FormCheckoutState state) {
    if (state is ServicesStateLoadingState) {
      MessageBox.showProgress(context, "loading".tr);
    } else if (state is Step1DetailsCheckoutErrorState) {
      MessageBox.showError(context, state.message);
    } else if (state is ServicesStateErrorState) {
      Get.back();
      MessageBox.showError(context, state.message);
    } else if (state is CheckoutSuccessfullyState) {
      Get.back();
      if (state.checkoutModule.steps?.next == "pay" && isCheckoutPay) {
        isCheckoutPay = false;
        context.read<FormCheckoutCubit>().checkout2("pay");
      } else if (state.checkoutModule.steps?.next == "finsh") {
        final message = state.checkoutModule.message ?? "--";
        NavigatorHandler.push(context, OrderSuccessPage(message: message));
      }
    }
  }
}
