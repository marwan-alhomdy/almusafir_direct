import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/enum/explore.dart';
import '../../../../../core/widget/card/card_vertical.widget.dart';

class FilterCategoryWidget extends StatelessWidget {
  const FilterCategoryWidget({super.key, required this.category});
  final ExploreFilter category;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Wrap(
        children: [
          "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
          "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
          "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
          "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
          "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
        ]
            .map((image) => SizedBox(
                  width: Get.width * 0.5,
                  child: CardVerticalWidget(
                    image: image,
                    title: "خصم 50% على جميع الرحلات".tr,
                    address: category.address,
                    price: category.price,
                    description: category.description,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
