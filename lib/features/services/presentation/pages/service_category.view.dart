import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/enum/booking_type.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../widgets/category_service/service_category.filterbar.dart';
import '../widgets/service_items.widget.dart';

class ServiceCategoryView extends StatefulWidget {
  const ServiceCategoryView({super.key, required this.orderType});
  final OrderType? orderType;

  @override
  State<ServiceCategoryView> createState() => _ServiceCategoryViewState();
}

class _ServiceCategoryViewState extends State<ServiceCategoryView> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    print(widget.orderType?.refType);

    return Scaffold(
      appBar: MyAppBarWithLogo(
        actions: [
          IconButton(
            icon: Icon(isGridView
                ? Iconsax.textalign_justifycenter
                : Iconsax.element_3_copy),
            onPressed: () => setState(() {
              isGridView = !isGridView;
            }),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        //controller: context.read<DepartmentBloc>().scrollController,
        slivers: [
          ServiceCategoryFilterbar(
            selectedBookingType: BookingType.hotel,
            onChanged: (v) {},
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              isGridView ? ListServiceItemsWidget() : GridServiceItemsWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
