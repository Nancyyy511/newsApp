import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view/screens/widgets/home/home_category_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        Text(
          'Good Morning',
          style: AppTextStyles.styleW500S22.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        Text(
          'Here is Some News For You',
          style: AppTextStyles.styleW500S22.copyWith(color: textColor),
        ),
        const SizedBox(height: 18),

        HomeCategoryCard(
          category: CategoryEnum.general,
          onViewAll: () => _openCategory(context, CategoryEnum.general),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.business,
          onViewAll: () => _openCategory(context, CategoryEnum.business),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.sports,
          onViewAll: () => _openCategory(context, CategoryEnum.sports),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.technology,
          onViewAll: () => _openCategory(context, CategoryEnum.technology),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.entertainment,
          onViewAll: () => _openCategory(context, CategoryEnum.entertainment),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.health,
          onViewAll: () => _openCategory(context, CategoryEnum.health),
        ),
        const SizedBox(height: 16),

        HomeCategoryCard(
          category: CategoryEnum.science,
          onViewAll: () => _openCategory(context, CategoryEnum.science),
        ),
      ],
    );
  }

  void _openCategory(BuildContext context, CategoryEnum category) {
    // The cubit stores the selected category (which switches the view and the
    // AppBar title) and loads its sources. Call it only once: every call
    // sends a new sources request.
    context.read<MainLayerCubit>().selectCategory(category);
  }
}
