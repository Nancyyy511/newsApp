import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  final Article articles;
  final VoidCallback? onTap;

  const NewsCard({super.key, required this.articles, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.primaryBlackColor
        : AppColors.primaryWhiteColor;

    final textColor = isDark
        ? AppColors.primaryWhiteColor
        : AppColors.primaryBlackColor;

    final secondaryTextColor = isDark ? Colors.white70 : Colors.black45;

    return Container(
      padding: EdgeInsets.all(8.r),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: isDark
              ? AppColors.primaryWhiteColor
              : AppColors.primaryBlackColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: AspectRatio(aspectRatio: 1.6.r, child: _buildImage()),
            ),

            const SizedBox(height: 10),

            Text(
              articles.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.styleW700S22.copyWith(color: textColor),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'By : ${articles.author?.trim().isNotEmpty == true ? articles.author : 'Unknown'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.styleW500S16.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  timeago.format(
                    DateTime.tryParse(articles.publishedAt ?? '') ??
                        DateTime.now(),
                    locale: 'en',
                  ),
                  style: AppTextStyles.styleW500S16.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final imageUrl = articles.urlToImage?.trim() ?? '';

    if (imageUrl.isEmpty) {
      return _imagePlaceholder(
        const Icon(
          Icons.image_not_supported_outlined,
          size: 40,
          color: Colors.grey,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,

      // Show loading indicator while downloading the image
      placeholder: (context, url) {
        return _imagePlaceholder(
          const CircularProgressIndicator(strokeWidth: 3, color: Colors.blue),
        );
      },

      // Show an icon if loading fails
      errorWidget: (context, url, error) {
        debugPrint('Failed to load image: $url');
        debugPrint('Image error: $error');

        return _imagePlaceholder(
          const Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
        );
      },
    );
  }

  Widget _imagePlaceholder(Widget child) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.black12,
        child: Center(child: child),
      ),
    );
  }
}
