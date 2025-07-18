import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/department_bloc/department_bloc.dart';
import '../logic/department_type_cubit/department_type_cubit.dart';
import '../widgets/shop/shopping.widget.dart';
import '../widgets/shop/shopping_type.filterbar.dart';
import '../widgets/shop/state/loading_shopping.widget.dart';

class ShopCategoryView extends StatefulWidget {
  const ShopCategoryView({super.key, required this.orderType});
  final OrderType? orderType;

  @override
  State<ShopCategoryView> createState() => _ShopCategoryViewState();
}

class _ShopCategoryViewState extends State<ShopCategoryView> {
  bool isGridView = false;

  String? get orderTypeRef => widget.orderType?.refType;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<DepartmentBloc>()),
        BlocProvider(
          create: (_) =>
              di.sl<DepartmentTypeCubit>()..getDepartmentType(orderTypeRef),
        ),
      ],
      child: Scaffold(
        appBar: MyAppBarWithFilter(
          backgroundColor: AppColorsWithTheme.backgroundScroll,
          isGridView: isGridView,
          onChange: (value) => setState(() => isGridView = value),
        ),
        body: BlocConsumer<DepartmentTypeCubit, DepartmentTypeState>(
          builder: _builderDepartment,
          listener: _listenerDepartment,
        ),
      ),
    );
  }

  Widget _builderDepartment(BuildContext context, DepartmentTypeState state) {
    if (state is DepartmentTypeErrorState) {
      return ErrorCustomWidget(state.message,
          onTap: () => _getDepartmentType(context));
    } else if (state is DepartmentTypeLoadingState) {
      return LoadingShoppingCategoryWidget(isGridView: isGridView);
    } else if (state is GetDepartmentTypeSuccessfullyState) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (state.departmentTypes.isNotEmpty) const ShoppingTypeFilterbar(),
          ShoppingWidget(isGridView: isGridView, orderType: widget.orderType),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  void _listenerDepartment(BuildContext context, DepartmentTypeState state) {
    if (state is GetDepartmentTypeSuccessfullyState) {
      final type = context.read<DepartmentTypeCubit>().selectedDepartmentType;
      BlocProvider.of<DepartmentBloc>(context)
          .add(GetShoppingDepartment(orderTypeRef, type?.id));
    }
  }

  void _getDepartmentType(BuildContext context) {
    context.read<DepartmentTypeCubit>().getDepartmentType(orderTypeRef);
  }
}
