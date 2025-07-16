part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class GetShoppingExplore extends ExploreEvent {
  const GetShoppingExplore(this.tagsTypeId);

  final int? tagsTypeId;

  @override
  List<Object> get props => [];
}
