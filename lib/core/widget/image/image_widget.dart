import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/resource/color_app.dart';
import '../../utils/resource/images.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.urlImage,
      {super.key,
      this.height,
      this.width,
      this.scaleX = false,
      this.errorWiget,
      this.fit = BoxFit.cover});
  final String urlImage;
  final double? height;
  final double? width;
  final bool scaleX;
  final Widget? errorWiget;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    if (urlImage.contains("assets/")) {
      return SizedBox(
        height: height,
        width: width,
        child: Transform.scale(
            scaleX: scaleX ? -1 : 1,
            child:
                Image.asset(urlImage, fit: fit, height: height, width: width)),
      );
    } else if (urlImage.trim() == "") {
      return SizedBox(
        height: height,
        width: width,
        child: errorWiget ??
            Center(
              child: Image.asset(AppImages.logo, color: AppColors.mainOneColor),
            ),
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: Transform.scale(
          scaleX: scaleX ? -1 : 1,
          child: CachedNetworkImage(
              imageUrl: urlImage,
              cacheKey: urlImage + DateTime.now().day.toString(),
              filterQuality: FilterQuality.high,
              imageBuilder: (context, imageProvider) => Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: fit),
                    ),
                  ),
              placeholder: (context, url) => Center(
                    child: Lottie.asset(AppLottie.LOADING_IMAGE),
                  ),
              errorWidget: (context, url, error) =>
                  errorWiget ??
                  Center(
                    child: Image.asset(
                      AppImages.logo,
                      color: AppColors.mainOneColor,
                    ),
                  )),
        ),
      );
    }
  }
}
