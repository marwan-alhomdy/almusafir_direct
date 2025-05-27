import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../domain/entities/notification.dart' as notifications;
import '../bloc/notitication_bloc/notification_bloc.dart';
import 'button_sheet_notifcation_widget.dart';
import 'continer_notification_widget.dart';

class NotitctionContinerWidget extends StatelessWidget {
  const NotitctionContinerWidget(
      {super.key, required this.isRead, required this.notification});
  final bool isRead;
  final notifications.Notification notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showNotifcation();

        if ((notification.isRead ?? false) == false) {
          context
              .read<NotificationBloc>()
              .add(ReadNotifcationEvent(id: notification.id ?? 0));
        }
      },
      child: ContinerNotificationWidget(notification: notification),
    );
  }

  void _showNotifcation() {
    BottomSheetWidget.showIsScroll(
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child:
                    ButtonSheetNotifcationWidget(notification: notification)),
          ],
        ),
      ),
    );
  }
}
