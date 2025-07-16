import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../api/favorite.api.dart';
import '../../data/models/department/data.dart';
import '../../utils/resource/color_app.dart';

class FavoriteShoppingWidget extends StatefulWidget {
  const FavoriteShoppingWidget({super.key, required this.shop});
  final ShoppingDepartment shop;

  @override
  State<FavoriteShoppingWidget> createState() => _FavoriteShoppingWidgetState();
}

class _FavoriteShoppingWidgetState extends State<FavoriteShoppingWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        bool isFavorite = widget.shop.userIsFavorite == 1;
        widget.shop.userIsFavorite = isFavorite ? 0 : 1;
        FavoriteApi.toggleFavorite(
            objectId: widget.shop.id, objectType: widget.shop.objectType);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            AppColorsWithTheme.background.withAlpha(120)), // غير اللون هنا
      ),
      icon: Icon(
        widget.shop.userIsFavorite == 1 ? Iconsax.heart : Iconsax.heart_copy,
        color: Colors.redAccent,
      ),
    );
  }
}
