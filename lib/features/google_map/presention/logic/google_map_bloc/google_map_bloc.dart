import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/function/toast_box.dart';
import '../../../data/model/wash_location.dart';
import '../../../domain/usescases/fetch_location.usecases.dart';
import '../../../domain/usescases/refresh_driver_location.usecases.dart';
part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapBlocState> {
  final FetchWashLocationUsecases fetchWashLocation;
  final RefreshDriverLocationUsecases refreshDriverLocation;

  GoogleMapBloc(
      {required this.fetchWashLocation, required this.refreshDriverLocation})
      : super(GoogleMapInitial()) {
    on<FetchWashLocationEvent>(_fetchWashLocationEvent);
    on<UpdateDriverLocationEvent>(_updateDriverLocationEvent);
  }

  Future<void> _fetchWashLocationEvent(
      FetchWashLocationEvent event, Emitter<GoogleMapBlocState> emit) async {
    emit(LoadingFetchWashLocationState());
    final failureOrSuccess = await fetchWashLocation(bounds: event.bounds);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorFetchWashLocationState(message: failuer.message),
        (locations) =>
            FetchWashLocationSuccessfulState(washLocations: locations)));
  }

  Future<void> _updateDriverLocationEvent(
      UpdateDriverLocationEvent event, Emitter<GoogleMapBlocState> emit) async {
    final failureOrSuccess = await refreshDriverLocation(event.location);
    failureOrSuccess.fold(
        (failuer) => ToastBox.showError(message: failuer.message),
        (message) => ToastBox.show(message: message));
  }
}
