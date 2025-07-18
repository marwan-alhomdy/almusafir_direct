import '../../../../core/utils/function/bottom_sheet.widget.dart';
import '../logic/form_checkout_cubit/form_checkout_cubit.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';
import '../widgets/form_service/bottomsheet_form_services.widget.dart';

class FormInputManager {
  FormInputManager(this.formServiceCubit);
  final FormServiceCubit formServiceCubit;

  void onFromAirport(FormCheckoutCubit formCheckoutCubit) {
    final data = {
      "order_type": formCheckoutCubit.orderType?.refType,
    };
    formServiceCubit.getFromAirport(data);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedFromAirport,
        onChanged: (value) {
          formCheckoutCubit.selectedFromAirport = value;
          formCheckoutCubit.fromTripController.text = value?.name ?? "";
        }));
  }

  void onToAirport(FormCheckoutCubit formCheckoutCubit) {
    final data = {
      "order_type": formCheckoutCubit.orderType?.refType,
      'from_airport_id': formCheckoutCubit.selectedFromAirport?.id,
    };
    formServiceCubit.getToAirport(data);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedToAirport,
        onChanged: (value) {
          formCheckoutCubit.selectedToAirport = value;
          formCheckoutCubit.toTripController.text = value?.name ?? "";
        }));
  }

  void onFlights(FormCheckoutCubit formCheckoutCubit) {
    formServiceCubit.getFlights(formCheckoutCubit.orderType?.refType);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedflight,
        onChanged: (value) {
          formCheckoutCubit.selectedflight = value;
          formCheckoutCubit.flightController.text = value?.name ?? "";
        }));
  }

  void onVehicleType(FormCheckoutCubit formCheckoutCubit) {
    formServiceCubit.getvehicleTyps();
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedVehicleType,
        onChanged: (value) {
          formCheckoutCubit.selectedVehicleType = value;
          formCheckoutCubit.vehicleTypeController.text = value?.name ?? "";
        }));
  }

  void onLoadsTypes(FormCheckoutCubit formCheckoutCubit) {
    formServiceCubit.getLoadsTypes(formCheckoutCubit.orderType?.refType);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedLoadsType,
        onChanged: (value) {
          formCheckoutCubit.selectedLoadsType = value;
          formCheckoutCubit.loadsTypeController.text = value?.name ?? "";
        }));
  }

  void onPaymentMothed(FormCheckoutCubit formCheckoutCubit) {
    formServiceCubit.getPaymentMethods(formCheckoutCubit.orderType?.refType);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: formCheckoutCubit.selectedpaymentMethod,
        onChanged: (value) {
          formCheckoutCubit.selectedpaymentMethod = value;
          formCheckoutCubit.paymentMethodTypeController.text =
              value?.name ?? "";
        }));
  }
}
