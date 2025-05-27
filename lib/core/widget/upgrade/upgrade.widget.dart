import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../../helper/language.helper.dart';

class UpgradeWidget extends StatelessWidget {
  const UpgradeWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final languageCode = LanguageHelper.isArabic ? 'ar' : 'en';
    return UpgradeAlert(
        showIgnore: false,
        cupertinoButtonTextStyle: Theme.of(context).textTheme.bodyMedium,
        dialogStyle: Platform.isIOS
            ? UpgradeDialogStyle.cupertino
            : UpgradeDialogStyle.material,
        upgrader: Upgrader(
          languageCode: languageCode,
          messages: UpgraderMessages(code: languageCode),
        ),
        child: child);
  }
}
