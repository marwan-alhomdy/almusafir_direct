import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/enum/explore.dart';
import 'card_category.widget.dart';
import 'header_category.widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: ExploreFilter.values.length - 1,
        itemBuilder: (context, index) {
          final category = ExploreFilter.values[index + 1];
          return Column(children: [
            HeaderCategoryWidget(category: category, onPressed: () {}),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
                  "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
                  "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
                  "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
                  "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
                ]
                    .map((image) => CardCategoryWidget(
                          image: image,
                          title: "خصم 50% على جميع الرحلات".tr,
                          address: category.address,
                          price: category.price,
                          description: category.description,
                        ))
                    .toList(),
              ),
            )
          ]);
        },
      ),
    );
  }
}
