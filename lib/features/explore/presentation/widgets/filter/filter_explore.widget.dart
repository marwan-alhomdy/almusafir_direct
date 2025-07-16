import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/widget/field/search_field.widget.dart';
import '../../../../../core/widget/sliver/sliver_persistent_header.dart';
import '../../../../shopping/data/models/department_type/department_type.dart';
import '../../logic/explore_bloc/explore_bloc.dart';
import '../../logic/explore_type_cubit/explore_type_cubit.dart';

class ExploreFilterbar extends StatefulWidget {
  const ExploreFilterbar({
    super.key,
  });

  @override
  State<ExploreFilterbar> createState() => _ExploreFilterbarState();
}

class _ExploreFilterbarState extends State<ExploreFilterbar> {
  late final ExploreTypeCubit exploreTCubit;
  @override
  void initState() {
    exploreTCubit = context.read<ExploreTypeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        height: 60, //110,
        child: Column(
          children: [
            //   const SizedBox(height: 50, child: SearchExploreFilterBarWidget()),
            const SizedBox(height: 5),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: exploreTCubit.exploreTypes.length,
                itemBuilder: _itemBuilder,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final exploreType = exploreTCubit.exploreTypes[index];
    final isSelected = exploreType.id == exploreTCubit.selectedExploreType?.id;
    return GestureDetector(
      onTap: () => changeExploreTypes(exploreType),
      child: Card.filled(
        color: isSelected ? Colors.blue : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageWidget(
                exploreType.image?.small ?? "",
                width: 25,
                height: 25,
              ),
            ),
            Text(
              exploreType.name ?? "---",
              style: AppTextStyles.getMediumStyle(
                color: isSelected ? Colors.white : null,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  void changeExploreTypes(DepartmentType? type) {
    if (exploreTCubit.selectedExploreType?.id == type?.id) return;
    exploreTCubit.selectedExploreType = type;
    context.read<ExploreBloc>().add(GetShoppingExplore(type?.id));
    setState(() {});
  }
}

class SearchExploreFilterBarWidget extends StatelessWidget {
  const SearchExploreFilterBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Card(
            elevation: 0.5,
            margin: EdgeInsets.zero,
            child: SearchFieldWidget(
                onFieldSubmitted: (value) {},
                controller: TextEditingController()),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            elevation: 0.5,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.mainOneColor,
            onPressed: openFilterDialog,
            child: const Icon(Iconsax.filter_copy),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  void openFilterDialog() {
    // ExploreFilter filter = value;
    // BottomSheetWidget.showIsScroll(
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     child: Column(
    //       spacing: 10,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         const SizedBox(height: 10),
    //         const LineButtonSheetWidget(),
    //         FilterItemWidget(
    //             value: value, onChanged: (value) => filter = value),
    //         ButtonWidget(
    //             onTap: () {
    //               Get.back();
    //               onChanged(filter);
    //             },
    //             text: "OK".tr),
    //         const SizedBox(height: 30),
    //       ],
    //     ),
    //   ),
    // );
  }
}
