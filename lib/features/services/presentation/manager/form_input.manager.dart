import '../../../../core/utils/function/bottom_sheet.widget.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';
import '../logic/services_cubit/services_cubit.dart';
import '../widgets/form_service/bottomsheet_form_services.widget.dart';

class FormInputManager {
  FormInputManager(this.formServiceCubit);
  final FormServiceCubit formServiceCubit;

  void onFromAirport(ServicesCubit servicesCubit) {
    final data = {
      "order_type": servicesCubit.orderType?.refType,
    };
    formServiceCubit.getFromAirport(data);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedFromAirport,
        onChanged: (value) {
          servicesCubit.selectedFromAirport = value;
          servicesCubit.fromTripController.text = value?.name ?? "";
        }));
  }

  void onToAirport(ServicesCubit servicesCubit) {
    final data = {
      "order_type": servicesCubit.orderType?.refType,
      'from_airport_id': servicesCubit.selectedFromAirport?.id,
    };
    formServiceCubit.getToAirport(data);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedToAirport,
        onChanged: (value) {
          servicesCubit.selectedToAirport = value;
          servicesCubit.toTripController.text = value?.name ?? "";
        }));
  }

  void onFlights(ServicesCubit servicesCubit) {
    formServiceCubit.getFlights(servicesCubit.orderType?.refType);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedflight,
        onChanged: (value) {
          servicesCubit.selectedflight = value;
          servicesCubit.flightController.text = value?.name ?? "";
        }));
  }

  void onVehicleType(ServicesCubit servicesCubit) {
    formServiceCubit.getvehicleTyps();
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedVehicleType,
        onChanged: (value) {
          servicesCubit.selectedVehicleType = value;
          servicesCubit.vehicleTypeController.text = value?.name ?? "";
        }));
  }

  void onLoadsTypes(ServicesCubit servicesCubit) {
    formServiceCubit.getLoadsTypes(servicesCubit.orderType?.refType);
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedLoadsType,
        onChanged: (value) {
          servicesCubit.selectedLoadsType = value;
          servicesCubit.loadsTypeController.text = value?.name ?? "";
        }));
  }

  void onPaymentMothed(ServicesCubit servicesCubit) {
    formServiceCubit.getPaymentMethods();
    BottomSheetWidget.showIsScroll(BottomSheetFormServicesWidget(
        formServiceCubit: formServiceCubit,
        valueSelected: servicesCubit.selectedpaymentMethod,
        onChanged: (value) {
          servicesCubit.selectedpaymentMethod = value;
          servicesCubit.paymentMethodTypeController.text = value?.name ?? "";
        }));
  }
}
