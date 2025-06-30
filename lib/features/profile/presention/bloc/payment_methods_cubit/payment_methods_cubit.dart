import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/service.module.dart';
import '../../../domain/usecases/get_paymens_available.usecases.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  PaymentMethodsCubit({required this.getPaymentMethodsAvailablesUsecases})
      : super(PaymentMethodsInitial());

  final GetPaymentMethodsAvailablesUsecases getPaymentMethodsAvailablesUsecases;

  void getPaymentMethodsAvailables() async {
    emit(LoadingPaymentMethodsState());

    final failureOrSuccess = await getPaymentMethodsAvailablesUsecases();

    emit(failureOrSuccess.fold(
        (failuer) => ErrorPaymentMethodsState(message: failuer.message),
        (paymentMethods) =>
            GetPaymentMethodsSuccessfulState(paymentMethods: paymentMethods)));
  }
}
