import 'package:flutter/material.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166,
      width: double.infinity,
      color: AppColors.primaryWhiteColor,
      alignment: Alignment.center,
      child: Text(
        'News App',
        style: AppTextStyles.styleW700S22.copyWith(
          color: AppColors.primaryBlackColor,
        ),
      ),
    );
  }
}
