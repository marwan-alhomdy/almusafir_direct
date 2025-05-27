import 'delegate.module.dart';
import 'order.module.dart';

class HomeModule {
  DelegateModule? worker;
  List<OrderModel>? orders;

  HomeModule({this.worker, this.orders});

  factory HomeModule.fromJson(Map<String, dynamic> json) => HomeModule(
        worker: json['worker'] == null
            ? null
            : DelegateModule.fromJson(json['worker'] as Map<String, dynamic>),
        orders: (json['orders'] as List<dynamic>?)
            ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'worker': worker?.toJson(),
        'orders': orders?.map((e) => e.toJson()).toList(),
      };
}
