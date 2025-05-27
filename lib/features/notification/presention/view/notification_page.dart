import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/utils/drwn/triangle_clipper.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../helper/cache_helper.dart';
import '../../../../helper/public_infromation.dart';
import '../../domain/entities/notification.dart' as n;
import '../bloc/notitication_bloc/notification_bloc.dart';
import '../widget/error_notification_widget.dart';
import '../widget/loading_notification_widget.dart';
import '../widget/notification_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<n.Notification> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryOneColor,
      appBar: MyAppbar(title: "notifications".tr),
      body: Stack(
        children: [
          ClipPath(
              clipper: TriangleClipper(),
              child: Container(color: Colors.white)),
          BlocProvider(
            create: (context) =>
                di.sl<NotificationBloc>()..add(const GetNotifcationEvent()),
            child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
              if (state is GetNotifcationSuccessfulState) {
                notifications = state.notifications;
                changeNoitfcation();
                return NotificationWidget(notifications: notifications);
              } else if (state is LoadingGetNotificationState) {
                return const LoadingNotificationWiget();
              } else if (state is ErrorGatNotifiationState) {
                return ErrorNotificationWiget(message: state.message);
              } else {
                return NotificationWidget(notifications: notifications);
              }
            }),
          )

          //  refreshIndicatorWidget()
        ],
      ),
    );
  }

  void changeNoitfcation() {
    Helper.notification = false;
    CacheHelper.setBool(CachedAppKey.isNotification, false);
  }
}
