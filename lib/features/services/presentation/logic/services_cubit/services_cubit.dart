import 'package:almusafir_direct/features/home/data/model/orderstypes/datum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../helper/public_infromation.dart';
import '../../../data/models/service.module.dart';
import '../../../domain/usecases/services/checkout2_uescases.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final Checkout2Uescases checkout2Uescases;
  ServicesCubit({
    required this.checkout2Uescases,
  }) : super(ServicesInitial());

  late final OrderType? orderType;
  void setOrderType(OrderType? orderType) {
    this.orderType = orderType;
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  final orderDateController = TextEditingController();
  final returnDateController = TextEditingController();

  final customerNoteController = TextEditingController();
  final loadNotesController = TextEditingController();
  final expectedTotalController = TextEditingController();

  final countPersonController = TextEditingController();
  final couponController = TextEditingController();
  final tipController = TextEditingController();

  bool isLoadFragileMaterials = false;
  bool isLoadStorageSensitive = false;
  bool isRoundTrip = true;

  //DropDown
  final fromTripController = TextEditingController();
  final toTripController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final loadsTypeController = TextEditingController();
  final paymentMethodTypeController = TextEditingController();
  final flightController = TextEditingController();

  ServiceModul? selectedFromAirport;
  ServiceModul? selectedToAirport;
  ServiceModul? selectedVehicleType;
  ServiceModul? selectedLoadsType;
  ServiceModul? selectedpaymentMethod;
  ServiceModul? selectedflight;

  void checkout2() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ServicesStateLoadingState());
      final failureOrSuccess = await checkout2Uescases(data: getDataCheckout());
      failureOrSuccess.fold(
          (failuer) => emit(ServicesStateErrorState(message: failuer.message)),
          (_) => emit(CheckoutSuccessfullyState()));
    }
  }

  Map<String, dynamic> getDataCheckout() {
    return {
      'step': "details_shiping_coupon",
      'payment_method_id': selectedpaymentMethod?.id?.toString(),
      'order_type': orderType?.refType,
      'vehicle_type_id': selectedVehicleType?.id?.toString(),
      'expected_cart_total': expectedTotalController.text,
      'customer_notes': customerNoteController.text,
      'load_ref_type': selectedLoadsType?.refType,
      'load_type_id': selectedLoadsType?.id,
      'load_notes': loadNotesController.text,
      'is_load_liter': orderType?.isLoadLiter,
      'is_load_storage_sensitive': isLoadStorageSensitive == true ? 1 : 0,
      'is_load_fragile_materials': isLoadFragileMaterials == true ? 1 : 0,
      'coupon_code': couponController.text,
      'load_people': countPersonController.text,
      'shipping_firstname': Helper.user?.name ?? "",
      'shipping_lastname': Helper.user?.name ?? "",
      'shipping_phone': Helper.user?.mobile,
      'shipping_email': Helper.user?.email,
      'tip_amount': tipController.text,
      'date_order': orderDateController.text,
      'return_date': returnDateController.text,
      'is_round_trip': isRoundTrip == true ? 1 : 0,
      'flight_number': selectedflight?.id,
      'departure_destination': selectedFromAirport?.id,
      'arrival_destination': selectedToAirport?.id,
    };
  }
}
