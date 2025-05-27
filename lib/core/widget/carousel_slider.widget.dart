import 'package:carousel_slider/carousel_slider.dart' as cslider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/resource/color_app.dart';
import '../view/image.view.dart';
import 'image/image_widget.dart';

class CarouselSliderGroupWidget extends StatefulWidget {
  const CarouselSliderGroupWidget(
      {super.key, this.height, required this.images});
  final List images;
  final double? height;
  @override
  State<CarouselSliderGroupWidget> createState() =>
      _CarouselSliderGroupWidgetState();
}

class _CarouselSliderGroupWidgetState extends State<CarouselSliderGroupWidget> {
  int _carouselSliderNumber = 0;
  void pageChanged(int value) {
    _carouselSliderNumber = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? const SizedBox()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSliderWidget(
                viewportFraction: 1,
                height: widget.height,
                onPageChanged: (v, e) => pageChanged(v),
                items: List.generate(
                  widget.images.length,
                  (index) => ImageSilderWidget(
                    image: widget.images[index].toString(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DocPointWidget(
                  countPoint: widget.images.length,
                  carouselSliderNumber: _carouselSliderNumber),
              const SizedBox(height: 10),
            ],
          );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget(
      {super.key,
      required this.items,
      this.height,
      required this.viewportFraction,
      this.onPageChanged});
  final List<Widget>? items;
  final double? height;
  final double viewportFraction;

  final Function(int index, cslider.CarouselPageChangedReason reason)?
      onPageChanged;

  @override
  Widget build(BuildContext context) {
    return cslider.CarouselSlider(
        options: cslider.CarouselOptions(
            height: height,
            aspectRatio: 16 / 8,
            viewportFraction: viewportFraction,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.linear,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: onPageChanged,
            scrollDirection: Axis.horizontal),
        items: items);
  }
}

class DocPointWidget extends StatelessWidget {
  const DocPointWidget({
    super.key,
    required this.countPoint,
    required this.carouselSliderNumber,
  });
  final int countPoint;
  final int carouselSliderNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        countPoint,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.only(right: 5),
          width: index == carouselSliderNumber ? 40.0 : 6.0,
          height: 6.0,
          decoration: BoxDecoration(
              gradient: AppGradientColors.mainGradien,
              borderRadius: BorderRadius.circular(20)),
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}

class ImageSilderWidget extends StatelessWidget {
  const ImageSilderWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => Get.to(() => ShowImageView(image: image)),
            child: ImageWidget(
              image,
              width: MediaQuery.of(context).size.width * 0.95,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
