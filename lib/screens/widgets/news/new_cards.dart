import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback? onTap;

  const NewsCard({super.key, required this.news, this.onTap});

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
              news.title,
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
                    'By : ${news.author?.trim().isNotEmpty == true ? news.author : 'Unknown'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.styleW500S16.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  _timeAgo(news.publishedAt),
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
    final imageUrl = news.imageUrl;

    if (imageUrl == null || imageUrl.isEmpty) {
      return const ColoredBox(
        color: Colors.black12,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 40,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: 1.sw,
      height: 220.h,

      errorBuilder: (context, error, stackTrace) {
        return const ColoredBox(
          color: Colors.black12,
          child: Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 40,
              color: Colors.grey,
            ),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return const ColoredBox(
          color: Colors.black12,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  String _timeAgo(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.isNegative) return 'Just now';
    if (difference.inSeconds < 60) return 'Just now';
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    }
    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    }
    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    return '${date.day}/${date.month}/${date.year}';
  }
}
