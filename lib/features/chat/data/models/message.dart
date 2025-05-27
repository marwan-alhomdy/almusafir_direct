class Message {
  bool? seen;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? content;
  String? direction;
  String? type;
  String? threadName;

  Message({
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.content,
    this.type,
    this.direction,
    this.threadName,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        seen: json['seen'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as int?,
        content: json['content'] as String?,
        type: json['type'] as String?,
        direction: json['direction'] as String?,
        threadName: json['threadName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'seen': seen,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
        'type': type,
        'content': content,
        'direction': direction,
        'threadName': threadName,
      };

  Message copyWith({
    bool? seen,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? content,
    String? direction,
    String? type,
    String? threadName,
  }) {
    return Message(
      seen: seen ?? this.seen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      content: content ?? this.content,
      direction: direction ?? this.direction,
      type: type ?? this.type,
      threadName: threadName ?? this.threadName,
    );
  }
}
