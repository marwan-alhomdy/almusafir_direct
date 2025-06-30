// ignore_for_file: must_be_immutable

import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../logic/chat_with_openai_cubit/chat_with_openai_cubit.dart';

class FooterChatWidget extends StatelessWidget {
  const FooterChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Card(
              elevation: 0.5,
              margin: EdgeInsets.zero,
              child: TextField(
                controller: context.read<ChatWithOpenaiCubit>().textController,
                maxLines: 5,
                minLines: 1,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message".tr,
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10)),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
                elevation: 0.5,
                foregroundColor: Colors.white,
                backgroundColor: AppColors.mainOneColor,
                onPressed: () => _sendMessage(context),
                child: Transform.scale(
                    scaleX: LanguageHelper.isArabic ? -1 : 1,
                    child: const Icon(Iconsax.send_1))),
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final chatWithOpenaiCubit = context.read<ChatWithOpenaiCubit>();
    chatWithOpenaiCubit.chatWithOpenai();

    // final controller = chatCubit(context);
    // if (controller.textController.text.trim().isNotEmpty) {
    //   controller.sendMessage(Message(
    //     seen: false,
    //     createdAt: DateTime.now(),
    //     content: controller.textController.text.trim(),
    //     direction: Random().nextBool() ? "IN" : "OUT",
    //     threadName: "",
    //   ));
    // }
    // controller.textController.text = "";
  }
}
