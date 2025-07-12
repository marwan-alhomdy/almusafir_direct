import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/image/image_widget.dart';
import '../logic/product_card_cubit/product_card_cubit.dart';

class CardProductCartWidget extends StatefulWidget {
  const CardProductCartWidget({super.key, required this.rowCart});
  final RowCartModel rowCart;

  @override
  State<CardProductCartWidget> createState() => _CardProductCartWidgetState();
}

class _CardProductCartWidgetState extends State<CardProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.all(5),
                child: ImageWidget(widget.rowCart.image?.small ?? "---",
                    width: 70, height: 70, fit: BoxFit.cover)),
            Expanded(
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: Text(
                          widget.rowCart.name ?? "---",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.getMediumStyle(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "${widget.rowCart.price}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        "${widget.rowCart.subtotal}\$",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.getBoldStyle(
                          color: AppColors.grayOneColor,
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<ProductCardCubit, ProductCardState>(
                        builder: (_, __) => (widget.rowCart.isLoading == true)
                            ? SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  backgroundColor: AppColors.mainOneColor,
                                  color: Colors.deepOrangeAccent,
                                ))
                            : CounterRowProductInCardWidget(
                                count: widget.rowCart.qty ?? 0,
                                onChanged: updateProductFromCart,
                              ),
                      ),
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

  void updateProductFromCart(int value) {
    context
        .read<ProductCardCubit>()
        .updateProductFromCart(widget.rowCart, value);
    widget.rowCart.qty = value;
    setState(() {});
  }
}

class CounterRowProductInCardWidget extends StatelessWidget {
  const CounterRowProductInCardWidget({
    super.key,
    required this.count,
    required this.onChanged,
  });

  final int count;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        (count > 1)
            ? SizedBox(
                height: 25,
                width: 25,
                child: FloatingActionButton.small(
                  heroTag: null,
                  elevation: 0.1,
                  backgroundColor: AppColors.mainOneColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorderAttribute.all(5),
                  child: Icon(Iconsax.minus_square, size: 16),
                  onPressed: () => onChanged(count - 1),
                ))
            : SizedBox(
                height: 25,
                width: 25,
                child: FloatingActionButton.small(
                  heroTag: null,
                  elevation: 0.1,
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorderAttribute.all(5),
                  child: Icon(Iconsax.trush_square, size: 16),
                  onPressed: () => onChanged(0),
                ),
              ),
        if (count >= 1)
          Text(
            count.toString(),
            style: AppTextStyles.getMediumStyle(fontSize: 16),
          ),
        if (count >= 1)
          SizedBox(
            height: 25,
            width: 25,
            child: FloatingActionButton.small(
              heroTag: null,
              elevation: 0.1,
              backgroundColor: AppColors.mainOneColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorderAttribute.all(5),
              child: Icon(Iconsax.add_square, size: 16),
              onPressed: () => onChanged(count + 1),
            ),
          ),
      ],
    );
  }
}
