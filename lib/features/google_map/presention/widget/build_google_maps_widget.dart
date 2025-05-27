import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/function/toast_box.dart';
import '../../../../core/utils/google_map/google_places/googel_plsces.widget.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../logic/google_map_bloc/google_map_bloc.dart';
import '../logic/google_map_cubit/controller_map_google_cubit.dart';
import '../view/details_location.view.dart';
import 'google/google_map_widget.dart';

class BuildGoogelMapsWidget extends StatefulWidget {
  const BuildGoogelMapsWidget({super.key});

  @override
  State<BuildGoogelMapsWidget> createState() => _BuildGoogelMapsWidgetState();
}

class _BuildGoogelMapsWidgetState extends State<BuildGoogelMapsWidget> {
  final searchPlaceController = TextEditingController();
  late ControllerMapGoogleCubit controllerMap;

  @override
  void initState() {
    controllerMap = context.read<ControllerMapGoogleCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              Expanded(
                child: GooglePlacesWidget(
                  searchPlaceController: TextEditingController(),
                  onSearchPlace: context
                      .read<ControllerMapGoogleCubit>()
                      .updateCameraPosition,
                ),
              ),
              const SizedBox(width: 5),
              FloatingActionButton(
                heroTag: 1,
                onPressed: () => context
                    .read<ControllerMapGoogleCubit>()
                    .moveToMyLocation(context),
                backgroundColor: AppColors.mainOneColor,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // FloatingActionButton(
          //   heroTag: 2,
          //   onPressed: () {},
          //   backgroundColor: AppColors.mainOneColor,
          //   child: const Icon(
          //     Iconsax.map_copy,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
      body: BlocListener<GoogleMapBloc, GoogleMapBlocState>(
        listener: _listenerMapBloc,
        child: BlocConsumer<ControllerMapGoogleCubit, ControllerMapGoogleState>(
          listener: (context, state) {},
          builder: (context, state) {
            return GoogleMapWidget(
              markerGoogleMap: controllerMap.markerManager.markerMap,
            );
          },
        ),
      ),
    );
  }

  void _listenerMapBloc(BuildContext context, GoogleMapBlocState state) {
    if (state is ErrorFetchWashLocationState) {
      ToastBox.show(message: state.message);
    } else if (state is FetchWashLocationSuccessfulState) {
      controllerMap.washLocations = state.washLocations;
      _fetchWashLocationSuccessful();
    }
  }

  void _fetchWashLocationSuccessful() {
    controllerMap.addWashsLocationToMap(context, (washLocation) {
      Get.bottomSheet(DetailsLocationView(washLocation: washLocation),
          isScrollControlled: true);
    });
  }
}
