abstract class Notification {
  final int? id;
  final String? title;
  final String? message;
  final String? from;
  final String? messageTo;
  final int? driverId;
  bool? isRead;
  final String? link;
  final String? createdAt;
  final String? updatedAt;

  Notification({
    this.id,
    this.title,
    this.message,
    this.from,
    this.messageTo,
    this.driverId,
    this.isRead,
    this.link,
    this.createdAt,
    this.updatedAt,
  });
}
