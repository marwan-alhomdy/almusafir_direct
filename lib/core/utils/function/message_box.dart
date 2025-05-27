import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../resource/text_style.dart';

import '../resource/color_app.dart';

class MessageBox {
  static void awesomeDialogWidget(BuildContext context) {
    var awesomeDialog = AwesomeDialog(
        context: context,
        title: "",
        body: const Text("", style: TextStyle(fontSize: 15)));
    awesomeDialog.show();
  }

  static void showWarning(BuildContext context, String message) {
    MessageBox.showDialog(context,
        textBody: message, dialogType: DialogType.warning);
  }

  static void showError(BuildContext context, String message) {
    MessageBox.showDialog(context,
        textBody: message, dialogType: DialogType.error);
  }

  static void showSuccess(BuildContext context, String message) {
    MessageBox.showDialog(context,
        textBody: message, dialogType: DialogType.success);
  }

  static void showQuestion(BuildContext context, String message) {
    MessageBox.showDialog(context,
        textBody: message, dialogType: DialogType.question);
  }

  static void showProgress(BuildContext context, String message) {
    MessageBox.showDialog(context,
        textBody: message, circularProgressIndicator: true, isDismi: false);
  }

  static void showDialog(BuildContext context,
      {bool isDismi = true,
      DialogType dialogType = DialogType.noHeader,
      required String textBody,
      bool circularProgressIndicator = false}) {
    AwesomeDialog awesomeDialog = AwesomeDialog(
      context: context,
      dialogType: dialogType,
      dismissOnTouchOutside: isDismi,
      dismissOnBackKeyPress: isDismi,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: !circularProgressIndicator
            ? Text(textBody,
                textAlign: TextAlign.center,
                style: AppTextStyles.getRegularStyle(fontSize: 16))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  if (circularProgressIndicator)
                    const CircularProgressIndicator(
                      color: AppColors.mainOneColor,
                    ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      textBody,
                      //textAlign: TextAlign.right,
                      overflow: TextOverflow.clip,
                      style: AppTextStyles.getRegularStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
      ),
    );
    awesomeDialog.show();
  }
}
