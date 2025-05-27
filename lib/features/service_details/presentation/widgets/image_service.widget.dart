import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widget/image/image_widget.dart';
import '../../../../core/view/image.view.dart';
import '../../../../core/widget/carousel_slider.widget.dart';

class ImageServiceWidget extends StatefulWidget {
  const ImageServiceWidget({super.key, required this.images});
  final List<String> images;
  @override
  State<ImageServiceWidget> createState() => _ImageServiceWidgetState();
}

class _ImageServiceWidgetState extends State<ImageServiceWidget> {
  int _carouselSliderNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSliderWidget(
            height: Get.width,
            viewportFraction: 1,
            onPageChanged: (v, e) => pageChanged(v),
            items: getAllImages()),
        Positioned(
          bottom: 20,
          child: DocPointWidget(
              countPoint: widget.images.length,
              carouselSliderNumber: _carouselSliderNumber),
        ),
      ],
    );
  }

  List<Widget>? getAllImages() {
    return widget.images
        .map((value) => InkWell(
            onTap: showProduct,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ImageWidget(value, fit: BoxFit.cover))))
        .toList();
  }

  void showProduct() {
    Get.to(() => ShowImageView(image: widget.images[_carouselSliderNumber]));
  }

  void pageChanged(int value) {
    _carouselSliderNumber = value;
  }
}
