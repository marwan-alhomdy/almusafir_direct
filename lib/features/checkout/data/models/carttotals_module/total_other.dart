import '../details_total_module/auto_coupon_shipping.dart';
import '../details_total_module/tax.dart';

class TotalOther {
  Tax? tax;
  AutoCouponShipping? autoCouponShipping;

  TotalOther({this.tax, this.autoCouponShipping});

  factory TotalOther.fromJson(Map<String, dynamic> json) => TotalOther(
        tax: json['tax'] == null
            ? null
            : Tax.fromJson(json['tax'] as Map<String, dynamic>),
        autoCouponShipping: json['auto_coupon_shipping'] == null
            ? null
            : AutoCouponShipping.fromJson(
                json['auto_coupon_shipping'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tax': tax?.toJson(),
        'auto_coupon_shipping': autoCouponShipping?.toJson(),
      };
}
