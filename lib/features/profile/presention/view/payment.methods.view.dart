import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/data/service.module.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../bloc/payment_methods_cubit/payment_methods_cubit.dart';

class PaymentMethodsWidget extends StatelessWidget {
  const PaymentMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di.sl<PaymentMethodsCubit>()..getPaymentMethodsAvailables(),
      child: Scaffold(
        appBar: const MyAppBarWithLogo(),
        body: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
          builder: (context, state) {
            if (state is LoadingPaymentMethodsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorPaymentMethodsState) {
              return Center(child: Text(state.message));
            } else if (state is GetPaymentMethodsSuccessfulState) {
              return PaymentMethodsAvailablesWidget(
                  paymentMethods: state.paymentMethods);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class PaymentMethodsAvailablesWidget extends StatelessWidget {
  const PaymentMethodsAvailablesWidget(
      {super.key, required this.paymentMethods});
  final List<ServiceModul> paymentMethods;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiterWidget(
      padding: const EdgeInsets.all(10),
      children: List.generate(
        paymentMethods.length,
        (index) => Card.filled(
          child: ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: ImageWidget(paymentMethods[index].logo?.original ?? ""),
            ),
            title: Text(paymentMethods[index].name ?? "---",
                style: AppTextStyles.getMediumStyle()),
            subtitle: Text(paymentMethods[index].description ?? "---",
                style: AppTextStyles.getRegularStyle()),
          ),
        ),
      ),
    );
  }
}
