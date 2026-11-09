import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';

class DrawerSettingItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DrawerSettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const color = AppColors.primaryWhiteColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryWhiteColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.styleW600S18.copyWith(color: color),
            ),
          ],
        ),
        const SizedBox(height: 12),

        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          dropdownColor: AppColors.primaryBlackColor,
          iconEnabledColor: color,
          style: AppTextStyles.styleW400S16.copyWith(color: color),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primaryWhiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primaryWhiteColor),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: AppTextStyles.styleW400S16.copyWith(color: color),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
