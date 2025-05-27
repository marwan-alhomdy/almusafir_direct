import 'package:almusafir_direct/features/home/presentation/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../core/locale/data_locale_translation.dart';
import 'core/firebase/firebase_message.dart';
import 'core/locale/locale_controller.dart';
import 'core/utils/resource/theme_app.dart';
import 'helper/api_helper.dart';
import 'helper/my_bloc_observer.dart';
import 'helper/public_infromation.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  Helper.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroudMessage);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();
  ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(backgroudMessage);
    Helper.firebaseMessage = AppFirebaseMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: "app_name".tr,
      builder: (context, child) => ScrollConfiguration(
        behavior: BehaviorScrollWidget(),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      locale: localeController.initLocale,
      translations: DataLoacleTranslations(),
      theme: Themes.themeDark,
    );
  }
}

class BehaviorScrollWidget extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
