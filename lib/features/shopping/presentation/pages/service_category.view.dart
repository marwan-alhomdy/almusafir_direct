import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/department_cubit/department_cubit.dart';
import '../logic/department_type_cubit/department_type_cubit.dart';
import '../widgets/category_service/loading_service_category.widget.dart';
import '../widgets/category_service/service_category.filterbar.dart';
import '../widgets/category_service/shopping.widget.dart';

class ServiceCategoryView extends StatefulWidget {
  const ServiceCategoryView({super.key, required this.orderType});
  final OrderType? orderType;

  @override
  State<ServiceCategoryView> createState() => _ServiceCategoryViewState();
}

class _ServiceCategoryViewState extends State<ServiceCategoryView> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<DepartmentCubit>()),
        BlocProvider(
          create: (context) => di.sl<DepartmentTypeCubit>()
            ..getDepartmentType(widget.orderType?.refType),
        ),
      ],
      child: Scaffold(
        appBar: MyAppBarWithLogo(
          backgroundColor: AppColorsWithTheme.backgroundScroll,
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
        body: BlocConsumer<DepartmentTypeCubit, DepartmentTypeState>(
          builder: _builderDepartment,
          listener: _listenerDepartment,
        ),
      ),
    );
  }

  void _listenerDepartment(BuildContext context, DepartmentTypeState state) {
    if (state is GetDepartmentTypeSuccessfullyState) {
      final type = context.read<DepartmentTypeCubit>().selectedDepartmentType;
      BlocProvider.of<DepartmentCubit>(context)
          .getShoppingDepartment(widget.orderType?.refType, type?.id);
    }
  }

  Widget _builderDepartment(BuildContext context, DepartmentTypeState state) {
    if (state is DepartmentTypeErrorState) {
      return ErrorCustomWidget(state.message,
          onTap: () => _getDepartmentType(context));
    } else if (state is DepartmentTypeLoadingState) {
      return LoadingServiceCategoryWidget(isGridView: isGridView);
    } else if (state is GetDepartmentTypeSuccessfullyState) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          ServiceCategoryFilterbar(),
          ShoppingWidget(isGridView: isGridView),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  void _getDepartmentType(BuildContext context) {
    context
        .read<DepartmentTypeCubit>()
        .getDepartmentType(widget.orderType?.refType);
  }
}
