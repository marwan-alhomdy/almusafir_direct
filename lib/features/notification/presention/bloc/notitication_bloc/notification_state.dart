part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

//! Successful

class ReadNotifcationSuccessfulState extends NotificationState {
  const ReadNotifcationSuccessfulState({required this.id});
  final int id;
}

class GetNotifcationSuccessfulState extends NotificationState {
  const GetNotifcationSuccessfulState(this.notifications);
  final List<Notification> notifications;
}

//! Error

class ErrorReadNotifiationState extends NotificationState {
  const ErrorReadNotifiationState({required this.message});
  final String message;
}

class ErrorGatNotifiationState extends NotificationState {
  const ErrorGatNotifiationState({required this.message});
  final String message;
}
//! Loading

class LoadingReadNotificationState extends NotificationState {}

class LoadingGetNotificationState extends NotificationState {}
