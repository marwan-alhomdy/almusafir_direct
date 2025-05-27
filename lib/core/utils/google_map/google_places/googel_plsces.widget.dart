import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

import '../../resource/color_app.dart';
import '../../resource/font_manager.dart';
import '../../resource/text_style.dart';
import '../../style/border_radius.dart';
import 'google_map_places.service.dart';
import 'place_autocomplet.module.dart';

enum StatueVisibility {
  hidden,
  displayed,
}

class GooglePlacesWidget extends StatefulWidget {
  const GooglePlacesWidget(
      {super.key,
      required this.searchPlaceController,
      required this.onSearchPlace});
  final TextEditingController searchPlaceController;
  final void Function(LatLng) onSearchPlace;
  @override
  GooglePlacesWidgetState createState() => GooglePlacesWidgetState();
}

class GooglePlacesWidgetState extends State<GooglePlacesWidget> {
  var uuid = const Uuid();
  StatueVisibility statueVisibility = StatueVisibility.displayed;
  List<PlaceAutocompletModel> places = [];
  String? sessiontoken;
  @override
  void initState() {
    super.initState();
    fetchPredictions();
  }

  void fetchPredictions() {
    widget.searchPlaceController.addListener(() async {
      sessiontoken ??= uuid.v4();
      if (statueVisibility == StatueVisibility.hidden) {
        statueVisibility = StatueVisibility.displayed;
      } else if (widget.searchPlaceController.text.trim().isNotEmpty) {
        try {
          var result = await GoogleMapsPlascesService.getPredictions(
            sessiontoken: sessiontoken!,
            input: widget.searchPlaceController.text,
          );
          places.clear();
          places.addAll(result);
          setState(() {});
        } catch (e) {/***/}
      } else {
        places.clear();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    widget.searchPlaceController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _SearchTextFildWidget(controller: widget.searchPlaceController),
        const SizedBox(height: 10),
        if (widget.searchPlaceController.text.trim().isNotEmpty &&
            places.isNotEmpty &&
            statueVisibility == StatueVisibility.displayed)
          _CustomListPracesWidget(
            places: places,
            onPlaseSelect: _plaseSelect,
          ),
      ],
    );
  }

  void _plaseSelect(PlaceAutocompletModel place) async {
    widget.searchPlaceController.text = place.description ?? "";
    statueVisibility = StatueVisibility.hidden;
    sessiontoken = null;
    places.clear();
    setState(() {});
    final placeId = place.placeId ?? "";
    try {
      var placeDetails =
          await GoogleMapsPlascesService.getPlacesDetails(placeId: placeId);
      widget.onSearchPlace(
        placeDetails.geometry!.location!.toLatLng(),
      );
    } catch (e) {/***/}
  }
}

class _SearchTextFildWidget extends StatelessWidget {
  const _SearchTextFildWidget({required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: AppBoxDecoration.mainBoxDecoration.copyWith(
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(61, 61, 61, 0.2),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            alignment: Alignment.center,
            child: const Icon(
              Iconsax.search_normal_copy,
              color: AppColors.grayTwoColor,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: AppColors.mainOneColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(8.0),
                hintText: "Search for Your Location".tr,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grayOneColor,
                  fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                ),
                enabledBorder: _getOutlineInputBorder(),
                focusedBorder: _getOutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _getOutlineInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.transparent, width: 1));
  }
}

class _CustomListPracesWidget extends StatelessWidget {
  const _CustomListPracesWidget(
      {required this.places, required this.onPlaseSelect});
  final List<PlaceAutocompletModel> places;
  final void Function(PlaceAutocompletModel) onPlaseSelect;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Flexible(
            child: Container(
              decoration: AppBoxDecoration.mainBoxDecoration.copyWith(
                borderRadius: BorderRadiusAttribute.top(12),
                boxShadow: [
                  const BoxShadow(
                    color: Color.fromRGBO(61, 61, 61, 0.2),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Iconsax.map_1_copy,
                        color: AppColors.secondaryOneColor),
                    onTap: () async {
                      try {
                        FocusScope.of(context).unfocus();
                        onPlaseSelect(places[index]);
                      } catch (e) {/***/}
                    },
                    title: Text(
                      places[index].description ?? "",
                      style: AppTextStyles.getRegularStyle(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
