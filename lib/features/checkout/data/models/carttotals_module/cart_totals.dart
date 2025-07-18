import '../details_total_module/auto_coupon_shipping.dart';
import '../details_total_module/details_total.module.dart';
import '../details_total_module/tax.dart';

class CartTotals {
  Tax? tax;
  AutoCouponShipping? autoCouponShipping;
  DetailTotalModule? subtotal;
  DetailTotalModule? cartTotal;
  DetailTotalModule? expectedCartTotal;
  DetailTotalModule? shippingCost;
  DetailTotalModule? shippingDiscount;
  DetailTotalModule? shippingTaxes;
  DetailTotalModule? shippingTotal;
  DetailTotalModule? expectedShippingTotal;
  DetailTotalModule? tip;
  DetailTotalModule? plusAmount;
  DetailTotalModule? minusAmount;
  DetailTotalModule? total;

  CartTotals({
    this.tax,
    this.autoCouponShipping,
    this.subtotal,
    this.cartTotal,
    this.expectedCartTotal,
    this.shippingCost,
    this.shippingDiscount,
    this.shippingTaxes,
    this.shippingTotal,
    this.expectedShippingTotal,
    this.tip,
    this.plusAmount,
    this.minusAmount,
    this.total,
  });

  factory CartTotals.fromJson(Map<String, dynamic> json) => CartTotals(
        tax: json['tax'] == null
            ? null
            : Tax.fromJson(json['tax'] as Map<String, dynamic>),
        autoCouponShipping: json['auto_coupon_shipping'] == null
            ? null
            : AutoCouponShipping.fromJson(
                json['auto_coupon_shipping'] as Map<String, dynamic>),
        subtotal: json['subtotal'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['subtotal'] as Map<String, dynamic>),
        cartTotal: json['cart_total'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['cart_total'] as Map<String, dynamic>),
        expectedCartTotal: json['expected_cart_total'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['expected_cart_total'] as Map<String, dynamic>),
        shippingCost: json['shipping_cost'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['shipping_cost'] as Map<String, dynamic>),
        shippingDiscount: json['shipping_discount'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['shipping_discount'] as Map<String, dynamic>),
        shippingTaxes: json['shipping_taxes'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['shipping_taxes'] as Map<String, dynamic>),
        shippingTotal: json['shipping_total'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['shipping_total'] as Map<String, dynamic>),
        expectedShippingTotal: json['expected_shipping_total'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['expected_shipping_total'] as Map<String, dynamic>),
        tip: json['tip'] == null
            ? null
            : DetailTotalModule.fromJson(json['tip'] as Map<String, dynamic>),
        plusAmount: json['plus_amount'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['plus_amount'] as Map<String, dynamic>),
        minusAmount: json['minus_amount'] == null
            ? null
            : DetailTotalModule.fromJson(
                json['minus_amount'] as Map<String, dynamic>),
        total: json['total'] == null
            ? null
            : DetailTotalModule.fromJson(json['total'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tax': tax?.toJson(),
        'auto_coupon_shipping': autoCouponShipping?.toJson(),
        'subtotal': subtotal?.toJson(),
        'cart_total': cartTotal?.toJson(),
        'expected_cart_total': expectedCartTotal?.toJson(),
        'shipping_cost': shippingCost?.toJson(),
        'shipping_discount': shippingDiscount?.toJson(),
        'shipping_taxes': shippingTaxes?.toJson(),
        'shipping_total': shippingTotal?.toJson(),
        'expected_shipping_total': expectedShippingTotal?.toJson(),
        'tip': tip?.toJson(),
        'plus_amount': plusAmount?.toJson(),
        'minus_amount': minusAmount?.toJson(),
        'total': total?.toJson(),
      };
}
