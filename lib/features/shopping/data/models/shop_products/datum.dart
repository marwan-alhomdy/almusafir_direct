class Datum {
  int? id;
  String? productsId;
  String? unitsId;
  String? unitsName;
  int? isMain;
  int? rate;
  String? pricesId;
  String? pricesName;
  int? isShowOldPrice;
  int? oldPrice;
  int? price;
  int? costedAmount;
  int? isParleying;
  int? manageStock;
  int? shopStock;
  int? calories;
  String? currencysId;
  String? mainCurrencysId;
  String? currencysIdName;
  int? isDefault;
  int? isActive;
  int? qty;

  Datum({
    this.id,
    this.productsId,
    this.unitsId,
    this.unitsName,
    this.isMain,
    this.rate,
    this.pricesId,
    this.pricesName,
    this.isShowOldPrice,
    this.oldPrice,
    this.price,
    this.costedAmount,
    this.isParleying,
    this.manageStock,
    this.shopStock,
    this.calories,
    this.currencysId,
    this.mainCurrencysId,
    this.currencysIdName,
    this.isDefault,
    this.isActive,
    this.qty,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        productsId: json['products_id'] as String?,
        unitsId: json['units_id'] as String?,
        unitsName: json['units_name'] as String?,
        isMain: json['is_main'] as int?,
        rate: json['rate'] as int?,
        pricesId: json['prices_id'] as String?,
        pricesName: json['prices_name'] as String?,
        isShowOldPrice: json['is_show_old_price'] as int?,
        oldPrice: json['old_price'] as int?,
        price: json['price'] as int?,
        costedAmount: json['costed_amount'] as int?,
        isParleying: json['is_parleying'] as int?,
        manageStock: json['manage_stock'] as int?,
        shopStock: json['shop_stock'] as int?,
        calories: json['calories'] as int?,
        currencysId: json['currencys_id'] as String?,
        mainCurrencysId: json['main_currencys_id'] as String?,
        currencysIdName: json['currencys_id_name'] as String?,
        isDefault: json['is_default'] as int?,
        isActive: json['is_active'] as int?,
        qty: json['qty'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'products_id': productsId,
        'units_id': unitsId,
        'units_name': unitsName,
        'is_main': isMain,
        'rate': rate,
        'prices_id': pricesId,
        'prices_name': pricesName,
        'is_show_old_price': isShowOldPrice,
        'old_price': oldPrice,
        'price': price,
        'costed_amount': costedAmount,
        'is_parleying': isParleying,
        'manage_stock': manageStock,
        'shop_stock': shopStock,
        'calories': calories,
        'currencys_id': currencysId,
        'main_currencys_id': mainCurrencysId,
        'currencys_id_name': currencysIdName,
        'is_default': isDefault,
        'is_active': isActive,
        'qty': qty,
      };
}
