import '../../domain/entities/notification.dart';

class NotificationModel extends Notification {
  NotificationModel(
      {super.id,
      super.title,
      super.message,
      super.from,
      super.messageTo,
      super.driverId,
      super.isRead,
      super.link,
      super.createdAt,
      super.updatedAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        message: json['message'] as String?,
        from: json['from'] as String?,
        messageTo: json['messageTo'] as String?,
        driverId: json['driverId'] as int?,
        isRead: json['isRead'] as bool?,
        link: json['link'] as String?,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'from': from,
        'messageTo': messageTo,
        'driverId': driverId,
        'isRead': isRead,
        'link': link,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
