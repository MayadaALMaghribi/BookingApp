import 'package:bookely/Fratures/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'feautre_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeautreAppBar(),
              FeatureListView(),
              Padding(
                padding: EdgeInsets.only(top: 35, left: 8, bottom: 30),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyles18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
