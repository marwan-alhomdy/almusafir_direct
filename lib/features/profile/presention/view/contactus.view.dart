import 'package:almusafir_direct/core/Animation/animation_limiter_widget.dart';
import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../widget/contactus/button_contactus.widget.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(title, style: AppTextStyles.getMediumStyle(fontSize: 16)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(
        actions: [
          ButtonContactUsWidget(),
          SizedBox(width: 10),
        ],
      ),
      body: AnimationLimiterWidget(
        horizontalOffset: 0,
        verticalOffset: 500,
        padding: const EdgeInsets.all(12),
        children: [
          sectionTitle("mobile".tr),
          ...Helper.primaryData?.data?.department?.data?.phone
                  ?.map((phone) => _InfoRowWidget(
                        icon: Iconsax.mobile_copy,
                        trailing: Iconsax.call,
                        title: phone.phoneNumber ?? "----",
                        subtitle: phone.phoneLabel,
                        color: Colors.green,
                        onTap: () => launchUrl(
                            Uri.parse("tel:${phone.phoneNumber}"),
                            mode: LaunchMode.externalApplication),
                      ))
                  .toList() ??
              [],
          sectionTitle("email".tr),
          ...Helper.primaryData?.data?.department?.data?.email
                  ?.map(
                    (email) => _InfoRowWidget(
                      icon: Icons.email,
                      trailing: Iconsax.send_1,
                      title: email.emailText ?? "---",
                      subtitle: email.emailLabel,
                      color: Colors.red,
                      onTap: () => launchUrl(
                          Uri.parse("mailto:${email.emailText}"),
                          mode: LaunchMode.externalApplication),
                    ),
                  )
                  .toList() ??
              [],
          sectionTitle("website".tr),
          ...Helper.primaryData?.data?.department?.data?.website
                  ?.map(
                    (website) => _InfoRowWidget(
                      icon: Icons.language,
                      trailing: Iconsax.send_1,
                      title: website.websiteUrl ?? "---",
                      subtitle: website.websiteLabel,
                      color: Colors.blue,
                      onTap: () => launchUrl(Uri.parse("${website.websiteUrl}"),
                          mode: LaunchMode.externalApplication),
                    ),
                  )
                  .toList() ??
              [],
          // sectionTitle("WhatsApp"),
          // _InfoRowWidget(
          //   icon: Iconsax.whatsapp,
          //   trailing: Iconsax.message,
          //   title: "www.almusafirr.com",
          //   color: Colors.green,
          //   onTap: () {},
          // ),
          // sectionTitle("Branches"),
          // BranchCardWidget(
          //     name: "Sana'a - Main Office",
          //     address: "Al-Kahraba Street, Sana'a, Yemen",
          //     phone: "+967 123 456 789"),
          // BranchCardWidget(
          //     name: "Aden Branch",
          //     address: "Al-Mualla District, Aden, Yemen",
          //     phone: "+967 123 456 780"),
          // BranchCardWidget(
          //     name: "Taiz Branch",
          //     address: "26 September Street, Taiz, Yemen",
          //     phone: "+967 123 456 797"),
        ],
      ),
    );
  }
}

class _InfoRowWidget extends StatelessWidget {
  const _InfoRowWidget(
      {required this.icon,
      required this.title,
      this.subtitle,
      required this.trailing,
      required this.color,
      required this.onTap});
  final IconData icon;
  final String title;
  final String? subtitle;

  final IconData trailing;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card.filled(
        child: ListTile(
          contentPadding: EdgeInsetsDirectional.only(start: 15),
          minTileHeight: 50,
          leading: Icon(icon, size: 18),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: subtitle == null || subtitle!.trim().isEmpty
              ? null
              : Text(subtitle ?? "---",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getRegularStyle()),
          trailing:
              IconButton(onPressed: onTap, color: color, icon: Icon(trailing)),
        ),
      ),
    );
  }
}
