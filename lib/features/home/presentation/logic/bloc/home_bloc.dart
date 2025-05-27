import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/cached/cached_name.dart';
import '../../../../../helper/cache_helper.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../data/model/getalldata/getalldata.dart';
import '../../../domain/usecases/get_all_data_uescases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchAllDataUseCases fetchAllData;
  HomeBloc({required this.fetchAllData}) : super(HomeInitial()) {
    on<FetchAllDataEvent>(_fetchAllDataEvent);
  }

  void _fetchAllDataEvent(
      FetchAllDataEvent event, Emitter<HomeState> emit) async {
    emit(const LoadingHomeState());
    final failureOrSuccess = await fetchAllData();
    failureOrSuccess.fold(
        (failuer) => emit(ErrorFetchAllDataState(message: failuer.message)),
        (data) {
      emit(FetchAllDataSuccessfullyState(data: data));
      _fetchAllDataSuccessfully(data);
    });
  }

  void _fetchAllDataSuccessfully(Getalldata data) {
    CacheHelper.setString(CachedAppKey.dataApp, json.encode(data));
    Helper.dataApp = data;
  }
}
