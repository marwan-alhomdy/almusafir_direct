import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../helper/public_infromation.dart';
import '../../../auth/persention/view/auth_view.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';
import '../logic/services_cubit/services_cubit.dart';
import '../widgets/form_service/form_service_input.widget.dart';

class FormServiceInputView extends StatelessWidget {
  const FormServiceInputView({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<ServicesCubit>()..setOrderType(orderType)),
        BlocProvider(create: (_) => di.sl<FormServiceCubit>()),
      ],
      child: Scaffold(
        appBar: MyAppBarWithLogo(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: FormServiceInputWidget(orderType: orderType),
                ),
              ),
              BlocListener<ServicesCubit, ServicesState>(
                listener: _listenerServicesCubit,
                child: Builder(builder: (context) {
                  return ButtonWidget(
                    text: "OK".tr,
                    onTap: () => checkout2(context),
                  );
                }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void checkout2(BuildContext context) {
    if (Helper.isAuth) {
      context.read<ServicesCubit>().checkout2();
    } else {
      Get.to(() => AuthView())?.then((_) {
        if (Helper.isAuth && context.mounted) {
          context.read<ServicesCubit>().checkout2();
        }
      });
    }
  }

  void _listenerServicesCubit(BuildContext context, ServicesState state) {
    if (state is ServicesStateLoadingState) {
      MessageBox.showProgress(context, "loading".tr);
    } else if (state is ServicesStateErrorState) {
      Get.back();
      MessageBox.showError(context, state.message);
    } else if (state is CheckoutSuccessfullyState) {
      Get.back();
      final message = "operation_was_completed_successfully".tr;
      MessageBox.showSuccess(context, message);
    }
  }
}
