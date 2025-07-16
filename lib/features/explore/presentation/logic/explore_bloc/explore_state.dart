part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreLoadingState extends ExploreState {}

final class ExploreErrorState extends ExploreState {
  final String message;
  const ExploreErrorState({required this.message});
}

final class ExploreSuccessfullyState extends ExploreState {
  final List<ShoppingDepartment> shoppingExplores;
  const ExploreSuccessfullyState(this.shoppingExplores);
}
