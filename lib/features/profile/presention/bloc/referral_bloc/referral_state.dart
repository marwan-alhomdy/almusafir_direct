part of 'referral_bloc.dart';

sealed class ReferralState extends Equatable {
  const ReferralState();

  @override
  List<Object> get props => [];
}

final class ReferralInitial extends ReferralState {}

final class LoadingReferralState extends ReferralState {}

final class ErrorReferralState extends ReferralState {
  final String message;
  const ErrorReferralState(this.message);
}

final class ReferralSeccessfulState extends ReferralState {
  final Referral referral;
  const ReferralSeccessfulState(this.referral);
}
