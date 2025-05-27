import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/wash_location.dart';
import '../../../domain/usescases/fetch_details_location.usecases.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final FetchDetailsLocationUsecases fetchDetailsLocationUsecases;
  LocationCubit({required this.fetchDetailsLocationUsecases})
      : super(LocationInitial());

  void fetchDetailsLocation(int washId) {
    emit(LoadingFetchDetailsLocationState());
    fetchDetailsLocationUsecases(washId).then(
      (value) => value.fold(
        (failure) =>
            emit(ErrorFetchDetailsLocationState(message: failure.message)),
        (detailsLocation) => emit(FetchDetailsLocationSuccessfulState(
            detailsLocation: detailsLocation)),
      ),
    );
  }
}
