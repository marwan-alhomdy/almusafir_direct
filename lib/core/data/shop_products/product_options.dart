class ProductOptions {
  List<dynamic>? data;

  ProductOptions({this.data});

  factory ProductOptions.fromJson(Map<String, dynamic> json) {
    return ProductOptions(
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
