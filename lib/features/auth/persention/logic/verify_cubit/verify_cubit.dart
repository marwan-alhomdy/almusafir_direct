import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/enum/field_name.auht.dart';
import '../../../../../core/data/current_user/current_user.dart';
import '../../../../../core/data/custom/country.dart';
import '../../../../../core/utils/function/input_type_helper.dart';
import '../../../domain/usecases/check_activation.usescases.dart';
import '../../../domain/usecases/send_activation.usecases.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final SendActivationUseCases sendActivationUseCases;
  final CheckActivationUseCases checkActivationUseCases;
  VerifyCubit({
    required this.sendActivationUseCases,
    required this.checkActivationUseCases,
  }) : super(VerifyInitial());

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

  Future<void> sendActivation(
      {FieldNameAuth fieldNameAuth = FieldNameAuth.activation}) async {
    emit(SendOtpLoading());
    final data = {
      "login": _mobileOrEmail,
      "field_name": fieldNameAuth.name,
      "api_version": "v2",
      'channel': 'otp_whatsapp',
    };
    final failureOrSuccess = await sendActivationUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => SendOtpError(message: failuer.message),
        (_) => SendOtpSuccess()));
  }

  Future<void> checkactivation(
      {FieldNameAuth fieldNameAuth = FieldNameAuth.activation}) async {
    emit(VerifyLoading());
    final data = {
      "login": _mobileOrEmail,
      "code": pinController.text,
      "field_name": fieldNameAuth.name,
      "api_version": "v2",
      'profile': true,
      'channel': 'otp_whatsapp',
    };
    final failureOrSuccess = await checkActivationUseCases(data: data);

    emit(failureOrSuccess.fold(
        (failuer) => VerifyError(message: failuer.message),
        (currentUser) => CheckActivationSuccess(currentUser: currentUser)));
  }
}
