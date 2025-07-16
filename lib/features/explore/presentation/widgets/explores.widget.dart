import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/state/error.widget.dart';
import '../logic/explore_bloc/explore_bloc.dart';
import '../logic/explore_type_cubit/explore_type_cubit.dart';
import 'category/card_explore.widget.dart';
import 'loading_explore.widget.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is ExploreErrorState) {
          return SliverFillRemaining(
              child: ErrorCustomWidget(state.message,
                  onTap: () => getShopping(context)));
        } else if (state is ExploreLoadingState) {
          return const SliverFillRemaining(
              child: LoadingExploreWidget(
            showHeader: false,
          ));
        } else if (state is ExploreSuccessfullyState) {
          return (state.shoppingExplores.isEmpty)
              ? const SliverFillRemaining(
                  child: Center(child: Text("لا توجد بيانات")))
              : SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CardExploresWidget(explores: state.shoppingExplores),
                    ],
                  ),
                );
        } else {
          return const SliverFillRemaining();
        }
      },
    );
  }

  void getShopping(BuildContext context) {
    final type = context.read<ExploreTypeCubit>().selectedExploreType;
    context.read<ExploreBloc>().add(GetShoppingExplore(type?.id));
  }
}
