import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/shop_products/shop_products.dart';
import '../../domain/usecases/get_other_services.uescases.dart';

part 'other_services_state.dart';

class OtherServicestsCubit extends Cubit<OtherServicesState> {
  final GetOtherServicesUescases getOtherServicesUescases;
  OtherServicestsCubit({required this.getOtherServicesUescases})
      : super(OtherServicesInitial());

  void getShopProducts(String? orderType) async {
    emit(OtherServicesLoadingState());

    final failureOrSuccess =
        await getOtherServicesUescases(orderType: orderType);

    emit(failureOrSuccess.fold(
        (failuer) => OtherServicesErrorState(message: failuer.message),
        FetchOtherServicesSuccessfullyState.new));
  }
}
