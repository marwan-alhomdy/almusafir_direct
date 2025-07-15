class UnitsDatum {
  int? id;
  String? productsId;
  String? unitsId;
  String? unitsName;
  num? isMain;
  num? rate;
  String? pricesId;
  String? pricesName;
  num? isShowOldPrice;
  num? oldPrice;
  num? price;
  num? costedAmount;
  num? isParleying;
  num? manageStock;
  num? shopStock;
  num? calories;
  String? currencysId;
  String? mainCurrencysId;
  String? currencysIdName;
  num? isDefault;
  num? isActive;
  num? qty;

  UnitsDatum({
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

  factory UnitsDatum.fromJson(Map<String, dynamic> json) => UnitsDatum(
        id: json['id'],
        productsId: json['products_id'],
        unitsId: json['units_id'],
        unitsName: json['units_name'],
        isMain: json['is_main'],
        rate: json['rate'],
        pricesId: json['prices_id'],
        pricesName: json['prices_name'],
        isShowOldPrice: json['is_show_old_price'],
        oldPrice: json['old_price'],
        price: json['price'],
        costedAmount: json['costed_amount'],
        isParleying: json['is_parleying'],
        manageStock: json['manage_stock'],
        shopStock: json['shop_stock'],
        calories: json['calories'],
        currencysId: json['currencys_id'],
        mainCurrencysId: json['main_currencys_id'],
        currencysIdName: json['currencys_id_name'],
        isDefault: json['is_default'],
        isActive: json['is_active'],
        qty: json['qty'],
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
