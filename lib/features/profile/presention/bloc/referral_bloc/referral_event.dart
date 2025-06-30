part of 'referral_bloc.dart';

sealed class ReferralEvent extends Equatable {
  const ReferralEvent();

  @override
  List<Object> get props => [];
}

class GetReferralMeBloc extends ReferralEvent {}
