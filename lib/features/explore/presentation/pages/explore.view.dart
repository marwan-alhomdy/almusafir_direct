import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/state/error.widget.dart';
import '../logic/explore_bloc/explore_bloc.dart';
import '../logic/explore_type_cubit/explore_type_cubit.dart';
import '../widgets/explores.widget.dart';
import '../widgets/filter/filter_explore.widget.dart';
import '../widgets/loading_explore.widget.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    context.read<ExploreTypeCubit>().initExploreType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: BlocConsumer<ExploreTypeCubit, ExploreTypeState>(
        builder: _builderExplore,
        listener: _listenerExplore,
      ),
    );
  }

  void _listenerExplore(BuildContext context, ExploreTypeState state) {
    if (state is GetExploreTypeSuccessfullyState) {
      final type = context.read<ExploreTypeCubit>().selectedExploreType;
      BlocProvider.of<ExploreBloc>(context).add(GetShoppingExplore(type?.id));
    }
  }

  Widget _builderExplore(BuildContext context, ExploreTypeState state) {
    if (state is ExploreTypeErrorState) {
      return ErrorCustomWidget(state.message,
          onTap: () => _getExploreType(context));
    } else if (state is ExploreTypeLoadingState) {
      return const LoadingExploreWidget();
    } else if (state is GetExploreTypeSuccessfullyState) {
      return const CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [ExploreFilterbar(), ShoppingWidget()],
      );
    } else {
      return const SizedBox();
    }
  }

  void _getExploreType(BuildContext context) {
    context.read<ExploreTypeCubit>().getExploreType();
  }
}
