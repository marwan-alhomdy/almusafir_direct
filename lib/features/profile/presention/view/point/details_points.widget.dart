import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../../core/widget/appbar/my_appbar.dart';
import '../../../data/model/point_module.dart';
import '../../bloc/point_cubit/point_cubit.dart';
import '../../widget/points/card_point.dart';

class DetaislPointsView extends StatelessWidget {
  const DetaislPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PointCubit>()..getPoints(),
      child: Scaffold(
        appBar: const MyAppBarWithLogo(),
        body: BlocBuilder<PointCubit, PointState>(
          builder: (context, state) {
            if (state is LoadingPointsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorPointsState) {
              return Center(child: Text(state.message));
            } else if (state is GetPointsSuccessfulState) {
              return _PointsWidget(points: state.points);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class _PointsWidget extends StatelessWidget {
  const _PointsWidget({required this.points});
  final List<PointModule> points;
  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
      return const Center(child: Text("لاتوجد عمليات"));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      physics: const ClampingScrollPhysics(),
      child: Column(
        spacing: 5,
        children: List.generate(
          points.length,
          (index) => CardPointWidget(
            title: points[index].name ?? "--",
            note: points[index].description ?? "--",
            createAt: points[index].createdAt,
          ),
        ),
      ),
    );
  }
}
