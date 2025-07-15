import 'package:almusafir_direct/core/utils/function/bottom_sheet.widget.dart';
import 'package:almusafir_direct/features/profile/presention/view/point/mypoint.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/locale/locale_controller.dart';
import '../../../../core/logic/theme_cubit/theme_cubit.dart';
import '../../../../core/utils/dialoge/messagebox_dialog_widget.dart';
import '../../../../helper/public_infromation.dart';
import '../../../auth/persention/view/auth_view.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../view/contactus.view.dart';
import '../view/payment.methods.view.dart';
import '../view/referral.view.dart';
import 'button/button_Acount.widget.dart';
import 'button/cardlist_profile.widget.dart';
import 'theme/change_theme.widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiterWidget(
      padding: const EdgeInsets.all(10),
      children: [
        Helper.isAuth
            ? const ButtonAcountWidget()
            : CardListProfileWidget(
                onTap: () => Get.to(() => const AuthView())
                    ?.then((value) => setState(() {})),
                icon: Iconsax.login,
                title: "login".tr,
              ),

        //  const ButtonFavoriteWidget(),
        CardListProfileWidget(
          onTap: () => Get.to(() => const PaymentMethodsWidget()),
          icon: Iconsax.card,
          title: "طرق الدفع".tr,
        ),

        CardListProfileWidget(
          onTap: () => Get.to(() => const ContactUsView()),
          icon: Iconsax.message,
          title: "تواصل معنا".tr,
        ),

        // CardListProfileWidget(
        //   onTap: () {},
        //   icon: Iconsax.information,
        //   title: "مركز المساعدة".tr,
        // ),
        // if (Helper.isAuth)
        //   CardListProfileWidget(
        //     onTap: () => Get.to(() => MyFavoritesView()),
        //     icon: Iconsax.heart,
        //     title: "المفضلة".tr,
        //   ),
        if (Helper.isAuth)
          CardListProfileWidget(
            onTap: () => Get.to(() => const MyPointsView()),
            icon: Iconsax.wallet,
            title: "نقاطي".tr,
          ),
        if (Helper.isAuth)
          CardListProfileWidget(
            onTap: () => Get.to(() => const ReferralView()),
            icon: Iconsax.share,
            title: "الإحالة".tr,
          ),

        CardListProfileWidget(
          onTap: () {
            final privacy = 'https://dev.rydan-res.com/ar/privacy';
            launchUrl(Uri.parse(privacy), mode: LaunchMode.externalApplication);
          },
          icon: Iconsax.information,
          title: "سياسة الخصوصية".tr,
        ),
        CardListProfileWidget(
          onTap: chingeLanguage,
          icon: Iconsax.translate,
          title: "language".tr,
        ),
        CardListProfileWidget(
          onTap: changeTheme,
          icon: Iconsax.sun_1,
          title: "تغيير الثيم".tr,
        ),

        if (Helper.isAuth) ...[
          CardListProfileWidget(
            onTap: () => deleteAccount(context),
            icon: Iconsax.trash,
            title: "Delete account".tr,
          ),
          CardListProfileWidget(
            onTap: () => _logout(context),
            icon: Iconsax.logout_1,
            title: "log_out".tr,
          )
        ],
      ],
    );
  }

  void chingeLanguage() {
    LocaleController localeController = Get.find();
    final codeLng = localeController.languageCode == "en" ? "ar" : "en";
    localeController.chingeLanguage(languageCode: codeLng);
    // Get.offAll(() => const SplashView());
  }

  void changeTheme() {
    BottomSheetWidget.show(
      ChangeThemeWidget(onChangeTheme: (isLight) {
        Get.back();
        final themeMode = isLight ? AppThemeMode.light : AppThemeMode.dark;
        context.read<ThemeCubit>().setTheme(themeMode);
      }, onDeleteTheme: () {
        Get.back();
        context.read<ThemeCubit>().setTheme(AppThemeMode.system);
      }),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (cxt) => MessageBoxDialogWidget(
        message: "want_to_logout".tr,
        onAccenpt: () {
          Get.back();
          context.read<ProfileBloc>().add(const LogoutProfileEvent());
        },
      ),
    );
  }

  void deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (cxt) => MessageBoxDialogWidget(
        message: "Delete account title".tr,
        onAccenpt: () {
          Get.back();
          context.read<ProfileBloc>().add(const DeleteAccountEvent());
        },
      ),
    );
  }
}
