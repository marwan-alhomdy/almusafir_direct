class Delegates {
  int? id;
  String? name;

  Delegates({this.id, this.name});

  factory Delegates.fromJson(Map<String, dynamic> json) => Delegates(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
