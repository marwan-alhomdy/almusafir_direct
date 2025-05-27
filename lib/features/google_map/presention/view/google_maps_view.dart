import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../logic/google_map_bloc/google_map_bloc.dart';
import '../logic/google_map_cubit/controller_map_google_cubit.dart';
import '../widget/build_google_maps_widget.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<GoogleMapBloc>()),
          BlocProvider(create: (context) => ControllerMapGoogleCubit())
        ],
        child: const Scaffold(
          appBar: MyAppBarWithLogo(),
          body: BuildGoogelMapsWidget(),
        ));
  }
}
