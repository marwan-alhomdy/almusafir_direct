import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/features/home/data/model/orderstypes/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/button/button_filter.widget.dart';
import '../../../data/models/department_type/department_type.dart';
import '../../logic/department_bloc/department_bloc.dart';
import '../../logic/department_type_cubit/department_type_cubit.dart';

class ShoppingTypeFilterbar extends StatefulWidget {
  const ShoppingTypeFilterbar({super.key, this.orderType});
  final OrderType? orderType;
  @override
  State<ShoppingTypeFilterbar> createState() => _ShoppingTypeFilterbarState();
}

class _ShoppingTypeFilterbarState extends State<ShoppingTypeFilterbar> {
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

    return ButtonFilterWidget(
      isSelected: departmentType.id == departmentTCubit.selectedDepartmentId,
      onSelected: () => changeDepartmentTypes(departmentType),
      image: departmentType.image?.small ?? "---",
      title: departmentType.name ?? "---",
    );
  }

  void changeDepartmentTypes(DepartmentType? type) {
    if (departmentTCubit.selectedDepartmentType?.id == type?.id) return;

    departmentTCubit.selectedDepartmentType = type;
    final orderType = widget.orderType?.refType;
    BlocProvider.of<DepartmentBloc>(context)
        .add(GetShoppingDepartment(orderType, type?.id));
    setState(() {});
  }
}
