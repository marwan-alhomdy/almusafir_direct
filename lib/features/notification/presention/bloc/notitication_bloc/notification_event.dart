part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class ReadNotifcationEvent extends NotificationEvent {
  const ReadNotifcationEvent({required this.id});
  final int id;
  @override
  List<Object> get props => [id];
}

class GetNotifcationEvent extends NotificationEvent {
  const GetNotifcationEvent();

  @override
  List<Object> get props => [];
}
