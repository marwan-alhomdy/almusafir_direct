import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/referral.dart';

class ReferralWidget extends StatelessWidget {
  const ReferralWidget({super.key, required this.referral});
  final Referral referral;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Image.network(
          referral.imageDisplay ?? "",
          height: 200,
          width: 200,
        ),
        Text(
          "دعوة الصديق والشركات",
          style: AppTextStyles.getMediumStyle(),
        ),
        Text(
          referral.textDisplay ?? "",
          style: AppTextStyles.getMediumStyle(color: Colors.grey),
        ),
        Text(
          "رمزك الشخصي",
          style: AppTextStyles.getMediumStyle(),
        ),
        CopyTextButton(referral.alias ?? ""),
        const SizedBox(),
        Text("أو شارك", style: AppTextStyles.getMediumStyle()),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                Uri alias =
                    Uri.parse('https://wa.me/?text=${referral.alias ?? ""}');
                await launchUrl(alias, mode: LaunchMode.externalApplication);
              },
              icon: const Icon(
                Iconsax.whatsapp,
                size: 25,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () async {
                Uri alias = Uri(
                  scheme: "sms",
                  path: "",
                  queryParameters: <String, String>{
                    'body': referral.alias ?? ""
                  },
                );

                await launchUrl(alias, mode: LaunchMode.externalApplication);
              },
              icon: const Icon(
                Iconsax.message,
                size: 25,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () async {
                final url =
                    "mailto:?subject=${Uri.encodeFull(referral.textDisplay ?? "")}&body=${Uri.encodeFull(referral.alias ?? "")}";

                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              },
              icon: const Icon(
                Icons.email_rounded,
                size: 25,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () => SharePlus.instance
                  .share(ShareParams(text: referral.alias ?? "")),
              icon: const Icon(
                Iconsax.share,
                size: 25,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CopyTextButton extends StatelessWidget {
  final String alias;
  const CopyTextButton(this.alias, {super.key});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: Get.width * 0.7,
      ),
      child: ElevatedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: alias));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Text(
                'تم نسخ النص!',
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // لون الخلفية
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // شكل الحافة
            side: const BorderSide(color: Colors.blue), // لون الحدود المنقطة
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Iconsax.copy, color: Colors.white),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  alias,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
