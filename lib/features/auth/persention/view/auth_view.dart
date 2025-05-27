import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../core/locale/locale_controller.dart';
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/set_auth.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/theme_app.dart';
import '../../../home/presentation/view/home_view.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widget/login_widget.dart';
import '/injection_container.dart' as di;
import 'package:get/get.dart';

class AuthintcationView extends StatelessWidget {
  const AuthintcationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.mainOneColor,
          actions: [
            IconButton(
              onPressed: _changeLanguage,
              icon: const Icon(Iconsax.translate),
            ),
            IconButton(
              onPressed: _changeTheme,
              icon: const Icon(Icons.theater_comedy),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: _listenerSignInBlocState,
          child: const LoginWidget(),
        ),
      ),
    );
  }

  void _listenerSignInBlocState(BuildContext context, AuthState state) {
    if (state is LoginSuccessfulState) {
      setAuth(state.user);
      Get.offAll(() => const HomeView());
    } else if (state is ErrorLoginState) {
      MessageBox.showError(context, state.message);
    }
  }

  void _changeLanguage() {
    LocaleController localeController = Get.find();
    final code = localeController.languageCode == "en" ? "ar" : "en";
    localeController.chingeLanguage(languageCode: code);
  }

  void _changeTheme() {
    bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? Themes.themeLight : Themes.themeDark);
  }
}
