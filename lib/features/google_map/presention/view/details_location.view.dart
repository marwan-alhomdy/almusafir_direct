import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '/injection_container.dart' as di;
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/liner.widget.dart';
import '../../data/model/wash_location.dart';
import '../logic/location_cubit/location_cubit.dart';
import '../widget/details_wash/details_location.widget.dart';

class DetailsLocationView extends StatelessWidget {
  const DetailsLocationView({super.key, required this.washLocation});
  final WashLocation washLocation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<LocationCubit>()..fetchDetailsLocation(washLocation.id ?? 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusAttribute.top(30),
            color: const Color.fromRGBO(250, 250, 250, 1)),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LineButtonSheetWidget(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "aDetails".tr,
                style: AppTextStyles.getMediumStyle(
                  fontSize: 18,
                  color: const Color(0xFF323234),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is ErrorFetchDetailsLocationState) {
                  return ErrorDetailsLocationWidget(
                    message: state.message,
                    washId: washLocation.id ?? 0,
                  );
                } else if (state is LoadingFetchDetailsLocationState) {
                  return Column(
                      children: List.generate(
                          6, (index) => const LoadingDetailsLocationShimmer()));
                } else if (state is FetchDetailsLocationSuccessfulState) {
                  return DetailsLocationWidget(
                      washLocation: state.detailsLocation);
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class ErrorDetailsLocationWidget extends StatelessWidget {
  const ErrorDetailsLocationWidget(
      {super.key, required this.message, required this.washId});
  final String message;
  final int washId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message),
          TextButton(
            onPressed: () =>
                context.read<LocationCubit>().fetchDetailsLocation(washId),
            child: Text("update".tr,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.mainOneColor)),
          ),
        ],
      ),
    );
  }
}

class LoadingDetailsLocationShimmer extends StatelessWidget {
  const LoadingDetailsLocationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
          leading: Image.asset(
            AppImages.LOGO_WHITE,
            color: Colors.white,
            height: 50,
            width: 50,
          ),
          title: Row(
            children: [
              Container(height: 15, width: 100, color: Colors.white),
            ],
          ),
          subtitle: Container(height: 15, color: Colors.white)),
    );
  }
}
