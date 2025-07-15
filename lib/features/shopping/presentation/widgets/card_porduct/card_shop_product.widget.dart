import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/widget/rating/rating.widget.dart';
import 'package:almusafir_direct/features/shopping/presentation/logic/shop_cart_cubit/shop_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/api/favorite.api.dart';
import '../../../../../core/data/shop_products/datum.dart';
import '../../../../../core/data/shop_products/shop_products.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/image/image_widget.dart';
import '../../../../../helper/public_infromation.dart';
import 'counter_product_in_card.widget.dart';

class CardShopProductWidget extends StatefulWidget {
  const CardShopProductWidget({super.key, required this.product});
  final ShopProduct product;

  @override
  State<CardShopProductWidget> createState() => _CardShopProductWidgetState();
}

class _CardShopProductWidgetState extends State<CardShopProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.all(5),
                child: ImageWidget(widget.product.image?.small ?? "---",
                    width: 70, height: 70, fit: BoxFit.cover)),
            Expanded(
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name ?? "---",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getMediumStyle(),
                        ),
                      ),
                      if (Helper.isAuth)
                        InkWell(
                          onTap: changeFavorite,
                          child: Icon(
                            widget.product.userIsFavorite == 1
                                ? Iconsax.heart
                                : Iconsax.heart_copy,
                            color: Colors.redAccent,
                          ),
                        ),
                    ],
                  ),
                  RatingWidget(
                    rating: widget.product.averageRating ?? 0,
                    sizeIcon: 12,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "${widget.product.price}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                        ),
                      ),
                      if ((widget.product.oldPrice ?? 0) > 0)
                        Text(
                          "${widget.product.oldPrice}\$",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getBoldStyle(
                            color: AppColors.grayOneColor,
                          ).copyWith(
                              decorationColor: Colors.red,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      QuantityProductinCardWidget(product: widget.product),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeFavorite() {
    bool isFavorite = widget.product.userIsFavorite == 1;
    widget.product.userIsFavorite = isFavorite ? 0 : 1;
    FavoriteApi.toggleFavorite(
        objectId: widget.product.id, objectType: widget.product.objectType);
    setState(() {});
  }
}

class QuantityProductinCardWidget extends StatefulWidget {
  const QuantityProductinCardWidget({super.key, required this.product});
  final ShopProduct product;

  @override
  State<QuantityProductinCardWidget> createState() =>
      _QuantityProductinCardWidgetState();
}

class _QuantityProductinCardWidgetState
    extends State<QuantityProductinCardWidget> {
  int count = 0;
  bool isLoaing = true;
  UnitsDatum? selectedUnit;

  @override
  void initState() {
    initSettingCount();
    super.initState();
  }

  @override
  void dispose() {
    widget.product.isLoading = false;
    super.dispose();
  }

  void initSettingCount() {
    final product = context
        .read<ShopCartCubit>()
        .rowCart
        .firstWhereOrNull((row) => row.id == widget.product.id);
    count = product?.qty ?? 0;
    if (product != null) {
      selectedUnit = UnitsDatum(
          id: product.id, unitsName: product.unitsName, price: product.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCartCubit, ShopCartState>(
      builder: (_, __) {
        return (widget.product.isLoading == true)
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.mainOneColor,
                  color: Colors.deepOrangeAccent,
                ))
            : CounterProductInCardWidget(
                count: count,
                product: widget.product,
                onChanged: changeCountProductInCart,
                onAddToCard: addProductToCart,
              );
      },
    );
  }

  void addProductToCart(int count, UnitsDatum? unit) {
    this.count == 0;
    selectedUnit = unit;
    context.read<ShopCartCubit>().addToCart(widget.product, count, unit);
    this.count = count;
    setState(() {});
  }

  void changeCountProductInCart(int count) {
    context
        .read<ShopCartCubit>()
        .updateCart(widget.product, count, selectedUnit);
    this.count = count;
    setState(() {});
  }
}
