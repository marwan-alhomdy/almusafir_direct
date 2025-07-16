part of 'explore_type_cubit.dart';

sealed class ExploreTypeState extends Equatable {
  const ExploreTypeState();

  @override
  List<Object> get props => [];
}

final class ExploreTypeInitial extends ExploreTypeState {}

final class ExploreTypeLoadingState extends ExploreTypeState {}

final class ExploreTypeErrorState extends ExploreTypeState {
  final String message;
  const ExploreTypeErrorState({required this.message});
}

final class GetExploreTypeSuccessfullyState extends ExploreTypeState {
  final List<DepartmentType> exploreTypes;
  const GetExploreTypeSuccessfullyState(this.exploreTypes);
}
