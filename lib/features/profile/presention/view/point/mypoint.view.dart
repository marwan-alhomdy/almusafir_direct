import 'package:almusafir_direct/features/profile/presention/widget/points/mypoint.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../../core/widget/appbar/my_appbar.dart';
import '../../bloc/point_cubit/point_cubit.dart';

class MyPointsView extends StatelessWidget {
  const MyPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PointCubit>()..getStatisticalPoints(),
      child: Scaffold(
        appBar: MyAppBarWithLogo(),
        body: BlocBuilder<PointCubit, PointState>(
          builder: (context, state) {
            if (state is LoadingPointsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorPointsState) {
              return Center(child: Text(state.message));
            } else if (state is StatisticalPointsSuccessfulState) {
              return MyPointsWidget(statisticalPoint: state.statisticalPoint);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
