import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/carousel_slider.widget.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../../core/widget/state/loading_widget.dart';
import '../../data/model/getalldata/data.dart';
import '../logic/bloc/home_bloc.dart';
import 'card_servsice.widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is FetchAllDataSuccessfullyState) {
          return _HomeWidget(state.data.data);
        } else if (state is ErrorFetchAllDataState) {
          return ErrorCustomWidget(
            message: state.message,
            onTap: () => context.read<HomeBloc>().add(FetchAllDataEvent()),
          );
        } else if (state is LoadingHomeState) {
          return const LoadingWiget();
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

class _HomeWidget extends StatelessWidget {
  const _HomeWidget(this.allData);
  final DataAllData? allData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<HomeBloc>().add(FetchAllDataEvent()),
      child: AnimationLimiterWidget(
        verticalOffset: -100,
        horizontalOffset: 0,
        physics: null,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                Text(
                  "${"Hello".tr} ${allData?.currentUser?.data?.name ?? ""} 👋",
                  style: AppTextStyles.getMediumStyle(fontSize: 18),
                ),
                Text(
                  "انطلق معنا للحصول على افضل الخدمات!" "🎁✨".tr,
                  style: AppTextStyles.getRegularStyle(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CarouselSliderGroupWidget(
              images: allData?.adverts?.data
                      ?.map((e) => e.image?.medium ?? "")
                      .toList() ??
                  []),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                shrinkWrap: true,
                childAspectRatio: 5 / 4,
                physics: NeverScrollableScrollPhysics(),
                children: allData?.orderstypes?.orderType
                        ?.map((e) => CardServsiceWidget(orderType: e))
                        .toList() ??
                    []),
          ),
          // SizedBox(height: 10),
          // Row(
          //   children: [
          //     SizedBox(width: 20),
          //     Icon(Iconsax.discount_shape_copy, size: 18),
          //     SizedBox(width: 5),
          //     Text(
          //       "العروض".tr,
          //       style: AppTextStyles.getMediumStyle(
          //         fontSize: 18,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 10),
          // SingleChildScrollView(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   physics: const ClampingScrollPhysics(),
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       _CardOfferWidget(
          //         image:
          //             "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
          //         title: "خصم 50% على جميع الرحلات".tr,
          //       ),
          //       _CardOfferWidget(
          //         image:
          //             "https://emiristanbul.com/wp-content/uploads/2020/12/ucuz-bilet.jpg",
          //         title: "خصم 50% على جميع الرحلات".tr,
          //       ),
          //       _CardOfferWidget(
          //         image:
          //             "https://elgzeratours.com/wp-content/uploads/2024/12/%D8%AA%D8%B0%D8%A7%D9%83%D8%B1-%D8%AD%D8%AC%D8%B2-%D8%A7%D9%84%D8%B7%D9%8A%D8%B1%D8%A7%D9%86-%D8%A8%D8%A3%D8%B1%D8%AE%D8%B5-%D8%A7%D9%84%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1.png",
          //         title: "خصم 50% على جميع الرحلات".tr,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class _CardOfferWidget extends StatelessWidget {
  const _CardOfferWidget({required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0.3,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.top(12),
                child: ImageWidget(image,
                    width: 200, height: 150, fit: BoxFit.cover)),
            SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.getMediumStyle(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
