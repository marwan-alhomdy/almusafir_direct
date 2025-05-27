import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/enum/explore.dart';
import '../widgets/category/category.widget.dart';
import '../widgets/category/filter_category.widget.dart';
import '../widgets/filter/filter_explore.widget.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  ExploreFilter selectedExplore = ExploreFilter.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(),
      body: Column(
        spacing: 10,
        children: [
          ExploreFilterBarWidget(
            value: selectedExplore,
            onChanged: (value) {
              setState(() => selectedExplore = value);
            },
          ),
          Expanded(
              child: selectedExplore == ExploreFilter.all
                  ? CategoryWidget()
                  : FilterCategoryWidget(category: selectedExplore)),
        ],
      ),
    );
  }
}
