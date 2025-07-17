import 'dart:developer';

import 'package:almusafir_direct/features/auth/persention/view/auth_view.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as transition;
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/widget/upgrade/upgrade.widget.dart';
import '../../../chat/presentation/logic/chat_cubit/chat_cubit.dart';
import '../../../chat/presentation/pages/chat.view.dart';
import '../../../explore/presentation/logic/explore_bloc/explore_bloc.dart';
import '../../../explore/presentation/logic/explore_type_cubit/explore_type_cubit.dart';
import '../../../explore/presentation/pages/explore.view.dart';
import '../../../order/presentation/logic/order_cubit/order_cubit.dart';
import '../../../order/presentation/pages/myorder.view.dart';
import '../../../profile/presention/view/profile.view.dart';
import '../logic/bloc/home_bloc.dart';
import '../widget/home.widget.dart';
import '../widget/navigation.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  void initState() {
    FirebaseMessaging.instance
        .subscribeToTopic("drivers")
        .then((v) => log("Success"))
        .catchError((e) => log("$e"));
    super.initState();
  }

  int currentIndex = 0;
  void chingeScreen(int index) {
    if (index == 1 && !Helper.isAuth) {
      Get.to(() => const AuthView(),
              duration: const Duration(milliseconds: 600),
              transition: transition.Transition.downToUp,
              curve: Curves.easeInOutCubicEmphasized)
          ?.then((_) {
        if (Helper.isAuth) {
          currentIndex = index;
          setState(() {});
        }
      });
    } else {
      currentIndex = index;
      setState(() {});
    }
  }

  void changeScreenWithBack(int index) {
    while (Navigator.canPop(context)) {
      Get.back();
    }
    chingeScreen(index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<HomeBloc>()..add(FetchAllDataEvent())),
        BlocProvider(create: (_) => di.sl<OrderCubit>()),
        BlocProvider(create: (_) => di.sl<ExploreBloc>()),
        BlocProvider(create: (_) => di.sl<ExploreTypeCubit>()),
        BlocProvider(create: (_) => ChatCubit()),
      ],
      child: UpgradeWidget(
        child: Scaffold(
            bottomNavigationBar: NavigationWidget(
              currentIndex: currentIndex,
              chingeScreen: chingeScreen,
            ),
            body: [
              const HomeWidget(),
              const MyOrdersView(),
              const ChatView(),
              const ExploreView(),
              const ProfileVeiw(),
            ][currentIndex]),
      ),
    );
  }
}
