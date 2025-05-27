import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../resource/color_app.dart';

class ToastBox {
  static void show({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        fontSize: 14.0);
  }

  static void showError({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.redOneColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showSuccess({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.greenOneColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
