class ValueOption {
  int? id;
  String? name;
  num? qty;
  num? price;
  num? subtotal;

  ValueOption({this.id, this.name, this.qty, this.price, this.subtotal});

  factory ValueOption.fromJson(Map<String, dynamic> json) => ValueOption(
        id: json['id'],
        name: json['name'],
        qty: json['qty'],
        price: json['price'],
        subtotal: json['subtotal'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'qty': qty,
        'price': price,
        'subtotal': subtotal,
      };
}
