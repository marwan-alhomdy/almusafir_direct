part of 'point_cubit.dart';

sealed class PointState extends Equatable {
  const PointState();

  @override
  List<Object> get props => [];
}

final class PointInitial extends PointState {}

class GetPointsSuccessfulState extends PointState {
  final List<PointModule> points;
  const GetPointsSuccessfulState({required this.points});
}

class StatisticalPointsSuccessfulState extends PointState {
  final StatisticalPointModule statisticalPoint;
  const StatisticalPointsSuccessfulState({required this.statisticalPoint});
}

//! Loading

class LoadingPointsState extends PointState {}

//! Error

class ErrorPointsState extends PointState {
  const ErrorPointsState({required this.message});
  final String message;
}
