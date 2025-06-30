import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/enum/direction_message.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../data/models/message.dart';

class ChatMessageCard extends StatelessWidget {
  final Message message;
  final bool isLoading;
  const ChatMessageCard({
    super.key,
    required this.message,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isIN = message.direction == DirectionMessage.IN.name;

    return Row(
      mainAxisAlignment:
          !isIN ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: getBorderRadius(isIN)),
          color: isIN ? AppColors.mainOneColor : null,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (isLoading)
                    ? SizedBox(
                        height: 30,
                        width: 30,
                        child: Lottie.asset(AppLottie.loadingChat))
                    : Text(message.content ?? "",
                        style: AppTextStyles.getRegularStyle()),
                const SizedBox(height: 5),
                _DateTimeMessageWidget(message, isIN)
              ],
            ),
          ),
        ),
      ],
    );
  }

  BorderRadius getBorderRadius(bool isIN) {
    return LanguageHelper.isArabic
        ? BorderRadius.only(
            bottomLeft: Radius.circular(isIN ? 16 : 0),
            bottomRight: Radius.circular(isIN ? 0 : 16),
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16))
        : BorderRadius.only(
            bottomLeft: Radius.circular(!isIN ? 16 : 0),
            bottomRight: Radius.circular(!isIN ? 0 : 16),
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
          );
  }
}

class _DateTimeMessageWidget extends StatelessWidget {
  const _DateTimeMessageWidget(this.message, this.direction);
  final Message message;
  final bool direction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat("hh:mm a").format(_getDateFormat(message.createdAt)),
          style: AppTextStyles.getRegularStyle(fontSize: 10),
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  DateTime _getDateFormat(DateTime? createdAt) =>
      (DateFormat("yyyy-MM-dd hh:mm a")
              .tryParse((createdAt ?? DateTime.now()).toString()) ??
          DateTime.now());
}
