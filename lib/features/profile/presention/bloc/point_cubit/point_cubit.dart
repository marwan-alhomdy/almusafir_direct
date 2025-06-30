import 'package:almusafir_direct/features/profile/data/model/point_module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/statistical_point_module.dart';
import '../../../domain/usecases/get_points.usecases.dart';
import '../../../domain/usecases/get_statistical_points.usecases.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  final GetPointsUseCases getPointsUseCases;
  final GetStatisticalPointsUseCases getStatisticalPointsUseCases;
  PointCubit(
      {required this.getStatisticalPointsUseCases,
      required this.getPointsUseCases})
      : super(PointInitial());

  void getPoints() async {
    emit(LoadingPointsState());

    final failureOrSuccess = await getPointsUseCases();

    emit(failureOrSuccess.fold(
        (failuer) => ErrorPointsState(message: failuer.message),
        (points) => GetPointsSuccessfulState(points: points)));
  }

  void getStatisticalPoints() async {
    emit(LoadingPointsState());

    final failureOrSuccess = await getStatisticalPointsUseCases();

    emit(failureOrSuccess.fold(
        (failuer) => ErrorPointsState(message: failuer.message),
        (statisticalPoint) => StatisticalPointsSuccessfulState(
            statisticalPoint: statisticalPoint)));
  }
}
