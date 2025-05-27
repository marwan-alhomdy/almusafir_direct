import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/api/add_fcm_api.dart';
import '../../../../core/widget/upgrade/upgrade.widget.dart';
import '../../../booking/presentation/pages/mybooking.view.dart';
import '../../../chat/presentation/pages/chat.view.dart';
import '../../../explore/presentation/pages/explore.view.dart';
import '../../../profile/presention/view/profile.view.dart';
import '../logic/bloc/home_bloc.dart';
import '../widget/home.widget.dart';
import '../widget/navigation.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    AddFcmApi.addFcmToken();
    FirebaseMessaging.instance
        .subscribeToTopic("drivers")
        .then((v) => log("Success"))
        .catchError((e) => log("$e"));
    super.initState();
  }

  int currentIndex = 0;
  void chingeScreen(int index) {
    currentIndex = index;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeBloc>()),
      ],
      child: UpgradeWidget(
        child: Scaffold(
            bottomNavigationBar: NavigationWidget(
              currentIndex: currentIndex,
              chingeScreen: chingeScreen,
            ),
            body: [
              const HomeWidget(),
              const MyBookingView(),
              const ChatView(),
              const ExploreView(),
              const ProfileVeiw(),
            ][currentIndex]),
      ),
    );
  }
}
