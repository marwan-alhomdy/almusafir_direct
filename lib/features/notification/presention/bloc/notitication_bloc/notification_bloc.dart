import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/notification.dart';
import '../../../domain/usecases/read_notifcation_usescases.dart';
import '../../../domain/usecases/get_notification_usecases.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ReadNotificationUseCases readNotification;
  final GetNotificationUseCases getNotification;
  NotificationBloc(
      {required this.readNotification, required this.getNotification})
      : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is ReadNotifcationEvent) {
        await _readNotifcation(event, emit);
      } else if (event is GetNotifcationEvent) {
        await _getNotifcation(event, emit);
      }
    });
  }
  Future<void> _readNotifcation(
      ReadNotifcationEvent event, Emitter<NotificationState> emit) async {
    emit(LoadingReadNotificationState());
    final failureOrChangeNotifcation = await readNotification(id: event.id);
    emit(failureOrChangeNotifcation.fold(
        (failuer) => ErrorReadNotifiationState(message: failuer.message),
        (_) => ReadNotifcationSuccessfulState(id: event.id)));
  }

  Future<void> _getNotifcation(
      GetNotifcationEvent event, Emitter<NotificationState> emit) async {
    emit(LoadingGetNotificationState());
    final failureOrGetNotifcation = await getNotification();

    emit(failureOrGetNotifcation.fold(
        (failuer) => ErrorGatNotifiationState(message: failuer.message),
        (notifications) => GetNotifcationSuccessfulState(notifications)));
  }
}
