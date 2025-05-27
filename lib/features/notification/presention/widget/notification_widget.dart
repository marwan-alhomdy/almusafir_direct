import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/notitication_bloc/notification_bloc.dart';

import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../domain/entities/notification.dart' as n;
import 'empty_notification_widget.dart';
import 'notifiction_continer_widget.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notifications});
  final List<n.Notification> notifications;
  @override
  Widget build(BuildContext context) {
    return notifications.isEmpty
        ? const EmptyNotificationWidget()
        : RefreshIndicator(
            color: AppColors.mainOneColor,
            onRefresh: () async {
              context.read<NotificationBloc>().add(const GetNotifcationEvent());
            }, // refrashGatDriverData,
            child: AnimationLimiterWidget(
                horizontalOffset: 0,
                verticalOffset: 0,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 40),
                  ...List.generate(
                    notifications.length,
                    (index) => NotitctionContinerWidget(
                      notification: notifications[index],
                      isRead: notifications[index].isRead ?? false,
                    ),
                  ),
                ]),
          );
  }
}
