import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/department_bloc/department_bloc.dart';
import '../logic/department_type_cubit/department_type_cubit.dart';
import '../widgets/shop/loading_service_category.widget.dart';
import '../widgets/shop/service_category.filterbar.dart';
import '../widgets/shop/shopping.widget.dart';

class ShopCategoryView extends StatefulWidget {
  const ShopCategoryView({super.key, required this.orderType});
  final OrderType? orderType;

  @override
  State<ShopCategoryView> createState() => _ShopCategoryViewState();
}

class _ShopCategoryViewState extends State<ShopCategoryView> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<DepartmentBloc>()),
        BlocProvider(
          create: (_) => di.sl<DepartmentTypeCubit>()
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
      BlocProvider.of<DepartmentBloc>(context)
          .add(GetShoppingDepartment(widget.orderType?.refType, type?.id));
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
          ShoppingWidget(isGridView: isGridView, orderType: widget.orderType),
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
