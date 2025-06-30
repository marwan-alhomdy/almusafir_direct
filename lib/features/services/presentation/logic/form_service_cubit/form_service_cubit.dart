import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/service.module.dart';
import '../../../domain/usecases/services/get_airport_uescases.dart';
import '../../../domain/usecases/services/get_flights_uescases.dart';
import '../../../domain/usecases/services/get_loads_types_uescases.dart';
import '../../../domain/usecases/services/get_payment_methods_uescases.dart';
import '../../../domain/usecases/services/get_vehicle_type_uescases.dart';
import '../../manager/form_input.manager.dart';

part 'form_service_state.dart';

class FormServiceCubit extends Cubit<FormServiceState> {
  final GetVehicleTypeUescases getVehicleTypeUescases;
  final GetLoadsTypesUescases getLoadsTypesUescases;
  final GetAirportUescases getAirportUescases;
  final GetPaymentMethodsUescases getPaymentMethodsUescases;
  final GetFlightsUescases getFlightsUescases;
  FormServiceCubit({
    required this.getVehicleTypeUescases,
    required this.getLoadsTypesUescases,
    required this.getAirportUescases,
    required this.getPaymentMethodsUescases,
    required this.getFlightsUescases,
  }) : super(FormServiceInitial()) {
    manager = FormInputManager(this);
  }

  late final FormInputManager manager;

  List<ServiceModul> vehicleTypes = [];
  List<ServiceModul> loadsTypes = [];
  List<ServiceModul> fromAirports = [];
  List<ServiceModul> paymentMethods = [];
  List<ServiceModul> flights = [];

  void getvehicleTyps() async {
    emit(FormServiceLoadingState());
    if (vehicleTypes.isNotEmpty) {
      emit(FormServicesSuccessfullyState(services: vehicleTypes));
    } else {
      final failureOrSuccess = await getVehicleTypeUescases();
      failureOrSuccess.fold(
          (failuer) => emit(FormServiceErrorState(message: failuer.message)),
          (vehicleTypes) {
        this.vehicleTypes = vehicleTypes;
        emit(FormServicesSuccessfullyState(services: vehicleTypes));
      });
    }
  }

  void getLoadsTypes(String? orderType) async {
    emit(FormServiceLoadingState());
    if (loadsTypes.isNotEmpty) {
      emit(FormServicesSuccessfullyState(services: loadsTypes));
    } else {
      final failureOrSuccess = await getLoadsTypesUescases(orderType ?? "");
      failureOrSuccess.fold(
          (failuer) => emit(FormServiceErrorState(message: failuer.message)),
          (loadsTypes) {
        this.loadsTypes = loadsTypes;
        emit(FormServicesSuccessfullyState(services: loadsTypes));
      });
    }
  }

  void getFromAirport(Map<String, dynamic> data) async {
    emit(FormServiceLoadingState());
    if (fromAirports.isNotEmpty) {
      emit(FormServicesSuccessfullyState(services: fromAirports));
    } else {
      final failureOrSuccess = await getAirportUescases(data: data);
      failureOrSuccess.fold(
          (failuer) => emit(FormServiceErrorState(message: failuer.message)),
          (fromAirports) {
        this.fromAirports = fromAirports;
        emit(FormServicesSuccessfullyState(services: fromAirports));
      });
    }
  }

  void getToAirport(Map<String, dynamic> data) async {
    emit(FormServiceLoadingState());
    final failureOrSuccess = await getAirportUescases(data: data);
    failureOrSuccess.fold(
        (failuer) => emit(FormServiceErrorState(message: failuer.message)),
        (airports) => emit(FormServicesSuccessfullyState(services: airports)));
  }

  void getPaymentMethods() async {
    emit(FormServiceLoadingState());
    if (paymentMethods.isNotEmpty) {
      emit(FormServicesSuccessfullyState(services: paymentMethods));
    } else {
      final failureOrSuccess = await getPaymentMethodsUescases();
      failureOrSuccess.fold(
          (failuer) => emit(FormServiceErrorState(message: failuer.message)),
          (paymentMethods) {
        this.paymentMethods = paymentMethods;
        emit(FormServicesSuccessfullyState(services: paymentMethods));
      });
    }
  }

  void getFlights(String? orderType) async {
    emit(FormServiceLoadingState());
    if (flights.isNotEmpty) {
      emit(FormServicesSuccessfullyState(services: flights));
    } else {
      final failureOrSuccess = await getFlightsUescases(orderType ?? "");
      failureOrSuccess.fold(
          (failuer) => emit(FormServiceErrorState(message: failuer.message)),
          (flights) {
        this.flights = flights;
        emit(FormServicesSuccessfullyState(services: flights));
      });
    }
  }
}
