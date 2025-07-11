import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:almusafir_direct/features/home/data/model/orderstypes/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/department_type/department_type.dart';
import '../../logic/department_bloc/department_bloc.dart';
import '../../logic/department_type_cubit/department_type_cubit.dart';

class ServiceCategoryFilterbar extends StatefulWidget {
  const ServiceCategoryFilterbar({super.key, this.orderType});
  final OrderType? orderType;
  @override
  State<ServiceCategoryFilterbar> createState() =>
      _ServiceCategoryFilterbarState();
}

class _ServiceCategoryFilterbarState extends State<ServiceCategoryFilterbar> {
  late final DepartmentTypeCubit departmentTCubit;
  @override
  void initState() {
    departmentTCubit = context.read<DepartmentTypeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      backgroundColor: AppColorsWithTheme.backgroundScroll,
      automaticallyImplyLeading: false,
      toolbarHeight: 55,
      titleSpacing: 0,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          itemCount: departmentTCubit.departmentTypes.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final departmentType = departmentTCubit.departmentTypes[index];
    final isSelected =
        departmentType.id == departmentTCubit.selectedDepartmentType?.id;
    return GestureDetector(
      onTap: () => changeDepartmentTypes(departmentType),
      child: Card.filled(
        color: isSelected ? Colors.blue : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageWidget(
                departmentType.image?.small ?? "",
                width: 25,
                height: 25,
              ),
            ),
            Text(
              departmentType.name ?? "---",
              style: AppTextStyles.getMediumStyle(
                color: isSelected ? Colors.white : null,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  void changeDepartmentTypes(DepartmentType? type) {
    if (departmentTCubit.selectedDepartmentType?.id == type?.id) return;
    departmentTCubit.selectedDepartmentType = type;
    final orderType = widget.orderType?.refType;
    context
        .read<DepartmentBloc>()
        .add(GetShoppingDepartment(orderType, type?.id));

    setState(() {});
  }
}
