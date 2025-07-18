import '../details_total_module/auto_coupon_shipping.dart';
import '../details_total_module/tax.dart';

class Conditions {
  Tax? tax;
  AutoCouponShipping? autoCouponShipping;

  Conditions({this.tax, this.autoCouponShipping});

  factory Conditions.fromJson(Map<String, dynamic> json) => Conditions(
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
