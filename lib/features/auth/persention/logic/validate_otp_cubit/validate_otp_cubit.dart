import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/enum/field_name.auht.dart';
import '../../../../../core/data/custom/country.dart';
import '../../../../../core/utils/function/input_type_helper.dart';
import '../../../../home/data/model/current_user/current_user.dart';
import '../../../domain/usecases/check_activation.usescases.dart';
import '../../../domain/usecases/send_activation.usecases.dart';
import '../../../domain/usecases/validate_otp_code.usecases.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  final ValidateOtpCodeUseCases verigyOtpUseCases;
  final SendActivationUseCases sendActivationUseCases;
  final CheckActivationUseCases checkActivationUseCases;
  ValidateOtpCubit({
    required this.verigyOtpUseCases,
    required this.sendActivationUseCases,
    required this.checkActivationUseCases,
  }) : super(ValidateOtpInitial());

  final GlobalKey<FormState> formState = GlobalKey();
  final mobileOrEmailController = TextEditingController();
  final pinController = TextEditingController();
  final pinputFocusNode = FocusNode();
  Country country = CountryManager.firstCountry();

  String? _mobileOrEmail;

  String get mobileOrEmail =>
      _mobileOrEmail ??
      (InputTypeHelper.isPhone(mobileOrEmailController.text)
          ? country.code + mobileOrEmailController.text
          : mobileOrEmailController.text);

  void setMobileOrEmail(String value) => _mobileOrEmail = value;

  Future<void> verifyOtpEvent() async {
    emit(ValidateOtpLoading());
    final data = {
      "login": _mobileOrEmail,
      "token": pinController.text,
      "api_version": "v2",
      'profile': '1',
      'channel': 'otp_whatsapp',
    };
    final failureOrSuccess = await verigyOtpUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => ValidateOtpError(message: failuer.message),
        (_) => ValidateOtpSuccess()));
  }

  Future<void> sendOtp() async {
    emit(ValidateOtpLoading());
    final data = {
      "login": _mobileOrEmail,
      "api_version": "v2",
      'channel': 'otp_whatsapp',
      'field_name': 'check_login',
    };
    final failureOrSuccess = await sendActivationUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => SendOtpError(message: failuer.message),
        (_) => SendOtpSuccess()));
  }

  Future<void> sendactivation(
      {FieldNameAuth fieldNameAuth = FieldNameAuth.activation}) async {
    emit(SendOtpLoading());
    final data = {
      "login": _mobileOrEmail,
      "api_version": "v2",
      'channel': 'otp_whatsapp',
      "field_name": fieldNameAuth.name,
    };
    final failureOrSuccess = await sendActivationUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => SendOtpError(message: failuer.message),
        (_) => SendOtpSuccess()));
  }

  Future<void> checkactivation(
      {FieldNameAuth fieldNameAuth = FieldNameAuth.activation}) async {
    emit(ValidateOtpLoading());
    final data = {
      "login": _mobileOrEmail,
      "code": pinController.text,
      "api_version": "v2",
      'profile': true,
      'channel': 'otp_whatsapp',
      "field_name": fieldNameAuth.name,
    };
    final failureOrSuccess = await checkActivationUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => ValidateOtpError(message: failuer.message),
        (currentUser) => CheckActivationSuccess(currentUser: currentUser)));
  }
}
