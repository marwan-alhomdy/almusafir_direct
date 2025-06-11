part of 'contact_us_cubit.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

final class ContactUsInitial extends ContactUsState {}

class ContactUsSuccessfulState extends ContactUsState {
  const ContactUsSuccessfulState();
}

//! Loading

class LoadingContactUsState extends ContactUsState {}

//! Error

class ErrorContactUsState extends ContactUsState {
  const ErrorContactUsState({required this.message});
  final String message;
}
