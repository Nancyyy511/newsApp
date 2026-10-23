import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/app_data.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class DrawerHomeButton extends StatelessWidget {
  const DrawerHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    const color = AppColors.primaryWhiteColor;

    return TextButton.icon(
      onPressed: () {
        Provider.of<MainScreenProvider>(
          context,
          listen: false,
        ).changeCategory(null);

        Navigator.pop(context);
      },
      icon: SvgPicture.asset(
        AppData.home,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.primaryWhiteColor,
          BlendMode.srcIn,
        ),
      ),
      label: Text(
        'Go To Home',
        style: AppTextStyles.styleW600S18.copyWith(color: color),
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
