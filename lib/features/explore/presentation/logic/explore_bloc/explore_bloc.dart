import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/department/data.dart';
import '../../../../shopping/domain/entities/gruop_department.dart';
import '../../../domain/usecases/get_explore.uescases.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetExploresUescases getExploresUescases;
  ExploreBloc({required this.getExploresUescases}) : super(ExploreInitial()) {
    on<GetShoppingExplore>(getShoppingExplore, transformer: restartable());
  }

  List<GroupDepartment> groupExplore = [];

  void getShoppingExplore(
      GetShoppingExplore event, Emitter<ExploreState> emit) async {
    emit(ExploreLoadingState());

    for (var groub in groupExplore) {
      if (groub.typeId == event.tagsTypeId) {
        emit(ExploreSuccessfullyState(groub.shoppingDepartments));
        return;
      }
    }

    final failureOrSuccess = await getExploresUescases(
        orderType: "explore", tagsTypeId: event.tagsTypeId?.toString() ?? "");

    failureOrSuccess.fold(
      (failuer) => emit(ExploreErrorState(message: failuer.message)),
      (shoppingExplores) {
        groupExplore.add(GroupDepartment(
            typeId: event.tagsTypeId, shoppingDepartments: shoppingExplores));
        emit(ExploreSuccessfullyState(shoppingExplores));
      },
    );
  }
}
