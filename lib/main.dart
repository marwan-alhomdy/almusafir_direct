import 'package:almusafir_direct/main.view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/firebase/firebase_message.dart';
import 'core/logic/theme_cubit/theme_cubit.dart';
import 'helper/cache_helper.dart';
import 'helper/my_bloc_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  await CacheHelper.init();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroudMessage);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();

  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}
