import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as transition;
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/handler/navigator.handler.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../helper/public_infromation.dart';
import '../../../auth/persention/view/auth_view.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/form_checkout_cubit/form_checkout_cubit.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';
import '../widgets/form_checkout_input.widget.dart';
import 'order_success.view.dart';

class FormCheckoutInputView extends StatelessWidget {
  FormCheckoutInputView({super.key, required this.orderType});

  final OrderType? orderType;

  bool isCheckoutPay = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<FormCheckoutCubit>()..setOrderType(orderType)),
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
                  child: FormCheckoutInputWidget(orderType: orderType),
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

  void checkout2(BuildContext context) {
    if (Helper.isAuth) {
      context.read<FormCheckoutCubit>().checkout2();
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
                    curve: Curves.easeInOutCubicEmphasized)
                ?.then((_) {
              if (Helper.isAuth && context.mounted) {
                context.read<FormCheckoutCubit>().checkout2();
              }
            });
          },
        ),
      );
    }
  }

  bool hhh = true;
  void _listenerServicesCubit(BuildContext context, FormCheckoutState state) {
    if (state is ServicesStateLoadingState) {
      MessageBox.showProgress(context, "loading".tr);
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
