import 'package:almusafir_direct/features/home/data/model/orderstypes/datum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/service.module.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../data/models/checkout_module.dart';
import '../../../domain/usecases/services/checkout2_uescases.dart';

part 'form_checkout_state.dart';

class FormCheckoutCubit extends Cubit<FormCheckoutState> {
  final Checkout2Uescases checkout2Uescases;
  FormCheckoutCubit({
    required this.checkout2Uescases,
  }) : super(ServicesInitial());

  late final OrderType? orderType;
  late final int? shopId;
  void setOrderType(OrderType? orderType, [int? shopId]) {
    this.orderType = orderType;
    this.shopId = shopId;
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

  CheckoutModule? checkoutModule;

  void step1Checkout() async {
    emit(Step1DetailsCheckoutLoadingState());
    final failureOrSuccess = await checkout2Uescases(
        data: getDataCheckout("details_shiping_coupon"));
    emit(failureOrSuccess.fold(
        (failuer) => Step1DetailsCheckoutErrorState(message: failuer.message),
        (checkoutModule) {
      this.checkoutModule = checkoutModule;
      return Step1DetailsCheckoutSuccessfullyState(checkoutModule);
    }));
  }

  void checkout2([String step = "details_shiping_coupon"]) async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ServicesStateLoadingState());
      final failureOrSuccess =
          await checkout2Uescases(data: getDataCheckout(step));
      emit(failureOrSuccess
          .fold((failuer) => ServicesStateErrorState(message: failuer.message),
              (checkoutModule) {
        this.checkoutModule = checkoutModule;
        return CheckoutSuccessfullyState(checkoutModule);
      }));
    }
  }

  Map<String, dynamic> getDataCheckout(String step) {
    return {
      "shop_id": shopId,
      'order_type': orderType?.refType,
      'step': step,
      'payment_method_id': selectedpaymentMethod?.id?.toString(),
      'shipping_method_id': selectedpaymentMethod?.id?.toString(),

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
      //TODO: add data
      'shipping_address_1': "I don't have address",
      'shipping_lat': 12.0,
      'shipping_lng': 12.0,
      "shipping_country": "2",
      "shipping_state": "3",
      "from_address_1": 2,
      'from_lat': 12.0,
      'from_lng': 12.0,
      "from_country": "2",
      "from_state": "3",
    };
  }
}
