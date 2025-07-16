import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shopping/data/models/department_type/department_type.dart';
import '../../../domain/usecases/get_type_explore.uescases.dart';

part 'explore_type_state.dart';

class ExploreTypeCubit extends Cubit<ExploreTypeState> {
  final GetTypeExploresUescases getTypeExploresUescases;
  ExploreTypeCubit({required this.getTypeExploresUescases})
      : super(ExploreTypeInitial());

  List<DepartmentType> exploreTypes = [];
  DepartmentType? selectedExploreType;
  void getExploreType() async {
    emit(ExploreTypeLoadingState());
    final failureOrSuccess =
        await getTypeExploresUescases(orderType: "explore");
    failureOrSuccess.fold(
        (failuer) => emit(ExploreTypeErrorState(message: failuer.message)),
        (types) {
      selectedExploreType = types.firstOrNull;
      exploreTypes = types;
      emit(GetExploreTypeSuccessfullyState(types));
    });
  }
}
