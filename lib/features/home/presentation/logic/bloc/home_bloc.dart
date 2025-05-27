import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/cached/cached_name.dart';
import '../../../../../core/data/models/delegate.module.dart';
import '../../../../../helper/cache_helper.dart';
import '../../../../../helper/public_infromation.dart';
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
        (delegate) {
      emit(FetchAllDataSuccessfullyState(delegate: delegate));
      _fetchAllDataSuccessfully(delegate);
    });
  }

  void _fetchAllDataSuccessfully(DelegateModule delegate) {
    CacheHelper.setString(CachedAppKey.deleagete, json.encode(delegate));
    Helper.delegate = delegate;
  }
}
