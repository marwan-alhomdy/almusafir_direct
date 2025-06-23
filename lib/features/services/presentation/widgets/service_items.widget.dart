import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Animation/animation_column_widget.dart';
import '../../../../core/Animation/scale_animation_widget.dart';
import '../../../../core/widget/card/card_category.widget.dart';
import '../../../../core/widget/card/card_vertical.widget.dart';
import '../../../service_details/presentation/pages/service_details.view.dart';

class ListServiceItemsWidget extends StatelessWidget {
  const ListServiceItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationColumnWidget(
      // padding: const EdgeInsets.all(10),
      // verticalOffset: 0,
      // horizontalOffset: 0,
      // physics: const ClampingScrollPhysics(),
      children: [
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
      ]
          .map((image) => CardVerticalWidget(
                image: image,
                title: "خصم 50% على جميع الرحلات".tr,
                address: "address",
                price: 100,
                description: "description",
                onPressed: () => Get.to(() => const ServiceDetailsView()),
              ))
          .toList(),
    );
  }
}

class GridServiceItemsWidget extends StatelessWidget {
  const GridServiceItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      spacing: 0,
      runSpacing: 0,
      children: [
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
      ]
          .map((image) => SizedBox(
                width: Get.width * 0.5,
                child: CardCategoryWidget(
                  image: image,
                  title: "خصم 50% على جميع الرحلات".tr,
                  address: "address",
                  price: 100,
                  description: "description",
                  onPressed: () => Get.to(() => const ServiceDetailsView()),
                ),
              ))
          .toList(),
    );
  }
}
