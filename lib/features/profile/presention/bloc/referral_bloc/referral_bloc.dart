import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/referral.dart';
import '../../../domain/usecases/get_referral.usecase.dart';

part 'referral_event.dart';
part 'referral_state.dart';

class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  final GetReferralUseCase getReferralUseCase;
  ReferralBloc({required this.getReferralUseCase}) : super(ReferralInitial()) {
    on<GetReferralMeBloc>(_referralEvent);
  }
  void _referralEvent(
      GetReferralMeBloc event, Emitter<ReferralState> emit) async {
    emit(LoadingReferralState());
    final failurOrReferral = await getReferralUseCase();
    emit(
      failurOrReferral.fold(
        (failur) => const ErrorReferralState(""),
        (referral) => ReferralSeccessfulState(referral),
      ),
    );
  }
}
