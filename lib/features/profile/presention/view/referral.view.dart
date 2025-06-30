import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart' as di;
import '../bloc/referral_bloc/referral_bloc.dart';
import '../widget/referral.widget.dart';

class ReferralView extends StatelessWidget {
  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ReferralBloc>()..add(GetReferralMeBloc()),
      child: Scaffold(
        appBar: MyAppBarWithLogo(),
        body: BlocBuilder<ReferralBloc, ReferralState>(
          builder: (context, state) {
            if (state is LoadingReferralState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorReferralState) {
              return Center(child: Text(state.message));
            } else if (state is ReferralSeccessfulState) {
              return ReferralWidget(referral: state.referral);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
