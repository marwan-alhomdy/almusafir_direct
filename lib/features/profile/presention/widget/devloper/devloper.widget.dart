import 'package:almusafir_direct/core/utils/resource/images.dart';
import 'package:almusafir_direct/core/widget/liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/constants/cached/devloper_info.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../button/cardlist_profile.widget.dart';

class DevloperWidget extends StatelessWidget {
  const DevloperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LineButtonSheetWidget(),
          Image.asset(AppImages.naonLogo, height: 80),
          Text('تم الإبتكار والتطوير بواسطة نانو سوفت',
              style: AppTextStyles.getMediumStyle(fontSize: 16)),
          const SizedBox(height: 20),
          CardListProfileWidget(
            onTap: () => _launchUrlString(DevloperInfo.webSoft),
            title: 'nano2soft.com',
            icon: Icons.language,
          ),
          CardListProfileWidget(
            onTap: () => _launchUrlString(DevloperInfo.phone1Url),
            title: DevloperInfo.phone1Numper,
            icon: Iconsax.call,
          ),
          CardListProfileWidget(
            onTap: () => _launchUrlString(DevloperInfo.phone2Url),
            title: DevloperInfo.phone2Numper,
            icon: Iconsax.call,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              IconButton(
                  onPressed: () => _launchUrlString(DevloperInfo.whatsapp),
                  color: Colors.green,
                  icon: const Icon(Iconsax.whatsapp)),
              IconButton(
                  onPressed: () => _launchUrlString(DevloperInfo.instagram),
                  color: Colors.pinkAccent,
                  icon: const Icon(Iconsax.instagram)),
              IconButton(
                  onPressed: () => _launchUrlString(DevloperInfo.facebook),
                  color: Colors.blue,
                  icon: const Icon(Iconsax.facebook)),
              //
              IconButton(
                  onPressed: () => _launchUrlString(DevloperInfo.x),
                  color: Colors.black,
                  icon: const Icon(Iconsax.xrp_xrp)),

              const SizedBox(),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _launchUrlString(String url) {
    Uri phoneno = Uri.parse(url);
    launchUrlString(phoneno.toString(), mode: LaunchMode.externalApplication);
  }
}
