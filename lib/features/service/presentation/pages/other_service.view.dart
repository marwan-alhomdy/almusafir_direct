import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '/injection_container.dart' as di;
import '../../../../core/widget/state/error.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../cubit/other_services_cubit.dart';
import '../widgets/loading_services.widget.dart';
import '../widgets/services.widget.dart';

class OtherServicesView extends StatefulWidget {
  const OtherServicesView({super.key, this.orderType});
  final OrderType? orderType;

  @override
  State<OtherServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<OtherServicesView> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<OtherServicestsCubit>()
        ..getShopProducts(widget.orderType?.refType),
      child: Scaffold(
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
            const SizedBox(width: 20),
          ],
        ),
        body: BlocBuilder<OtherServicestsCubit, OtherServicesState>(
          builder: _builderShopProducts,
        ),
      ),
    );
  }

  Widget _builderShopProducts(BuildContext context, OtherServicesState state) {
    if (state is OtherServicesErrorState) {
      return ErrorCustomWidget(state.message,
          onTap: () => context.read<OtherServicestsCubit>()
            ..getShopProducts(
              widget.orderType?.refType,
            ));
    } else if (state is OtherServicesLoadingState) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: isGridView
              ? const LoadingGridServicesWidget()
              : const LoadingListServicesWidget());
    } else if (state is FetchOtherServicesSuccessfullyState) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: isGridView
              ? GridServicesWidget(services: state.products)
              : ListServicesWidget(services: state.products));
    } else {
      return const SizedBox();
    }
  }
}
