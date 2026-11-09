import 'package:flutter/material.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/l10n/app_localizations.dart';

class HomeCategoryCard extends StatelessWidget {
  final CategoryEnum category;
  final VoidCallback onViewAll;

  const HomeCategoryCard({
    super.key,
    required this.category,
    required this.onViewAll,
  });

  Widget buildViewAllButton({
    required bool imageOnLeft,
    required bool isDark,
    required String viewAllText,
  }) {
    final buttonColor = isDark
        ? AppColors.primaryBlackColor
        : AppColors.primaryWhiteColor;

    final buttonTextColor = isDark
        ? AppColors.primaryWhiteColor
        : AppColors.primaryBlackColor;

    return GestureDetector(
      onTap: onViewAll,
      child: SizedBox(
        width: 180,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!imageOnLeft) const SizedBox(width: 30),
                  Text(
                    viewAllText,
                    style: AppTextStyles.styleW500S16.copyWith(
                      color: buttonTextColor,
                      fontSize: 18,
                    ),
                  ),
                  if (imageOnLeft) const SizedBox(width: 30),
                ],
              ),
            ),

            Positioned(
              left: imageOnLeft ? null : 0,
              right: imageOnLeft ? 0 : null,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: buttonColor,
                child: Icon(
                  imageOnLeft ? Icons.chevron_right : Icons.chevron_left,
                  color: buttonTextColor,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = isDark
        ? AppColors.primaryBlackColor
        : AppColors.primaryWhiteColor;

    final textColor = isDark
        ? AppColors.primaryBlackColor
        : AppColors.primaryWhiteColor;

    final title = category.getTitle(context);
    final imageOnLeft = category.imageOnLeft;

    final imagePath = isDark ? category.darkImage : category.lightImage;

    return Container(
      height: 198,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            alignment: imageOnLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),

          Positioned(
            top: 24,
            left: 24,
            right: 24,
            child: Align(
              alignment: imageOnLeft ? Alignment.topRight : Alignment.topLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.styleW700S22.copyWith(color: textColor),
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Align(
              alignment: imageOnLeft
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: buildViewAllButton(
                imageOnLeft: imageOnLeft,
                isDark: isDark,
                viewAllText: AppLocalizations.of(context)!.viewAll,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
