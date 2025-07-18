import 'cart_data_modele/cart_data.dart';
import 'carttotals_module/cart_totals.dart';
import 'input_data_model/input_data.dart';
import 'process_data_module/process_data.dart';
import 'steps_module/steps.dart';

class CheckoutModule {
  int? code;
  bool? status;
  bool? stepStatus;
  String? message;
  dynamic error;
  List<dynamic>? errors;
  InputData? inputData;
  ProcessData? processData;
  Steps? steps;
  CartData? cartData;
  CartTotals? cartTotals;

  CheckoutModule({
    this.code,
    this.status,
    this.stepStatus,
    this.message,
    this.error,
    this.errors,
    this.inputData,
    this.processData,
    this.steps,
    this.cartData,
    this.cartTotals,
  });

  factory CheckoutModule.fromJson(Map<String, dynamic> json) {
    return CheckoutModule(
      code: json['code'],
      status: json['status'],
      stepStatus: json['step_status'],
      message: json['message'],
      error: json['error'] as dynamic,
      errors: json['errors'] as List<dynamic>?,
      // inputData: json['input_data'] == null
      //     ? null
      //     : InputData.fromJson(json['input_data'] as Map<String, dynamic>),
      // processData: json['process_data'] == null
      //     ? null
      //     : ProcessData.fromJson(json['process_data'] as Map<String, dynamic>),
      steps: json['steps'] == null
          ? null
          : Steps.fromJson(json['steps'] as Map<String, dynamic>),
      // cartData: json['cart_data'] == null
      //     ? null
      //     : CartData.fromJson(json['cart_data'] as Map<String, dynamic>),
      cartTotals: json['cart_totals'] == null
          ? null
          : CartTotals.fromJson(json['cart_totals'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'step_status': stepStatus,
        'message': message,
        'error': error,
        'errors': errors,
        'input_data': inputData?.toJson(),
        'process_data': processData?.toJson(),
        'steps': steps?.toJson(),
        'cart_data': cartData?.toJson(),
        'cart_totals': cartTotals?.toJson(),
      };
}
