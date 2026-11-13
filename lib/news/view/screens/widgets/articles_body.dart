import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/view/screens/widgets/news/new_cards.dart';
import 'package:news_app/news/view/screens/sub_views/article_detail_view.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

class ArticlesBody extends StatelessWidget {
  final String sourceID;

  const ArticlesBody({super.key, required this.sourceID});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      // Only articles states are interesting for this widget.
      buildWhen: (previous, current) {
        return current is GetArticlesLoading ||
            current is GetArticlesSuccess ||
            current is GetArticlesError;
      },
      builder: (context, state) {
        if (state is GetArticlesError && state.sourceId == sourceID) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetArticlesSuccess && state.sourceId == sourceID) {
          final List<Article> articleList = state.articles;

          if (articleList.isEmpty) {
            return const Center(child: Text('No articles available'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return NewsCard(
                articles: articleList[index],
                onTap: () => _showArticlePreview(context, articleList[index]),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          );
        }

        // GetArticlesLoading for this source, or a state that belongs to
        // another tab (for example while swiping between tabs).
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void _showArticlePreview(BuildContext context, Article article) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetColor = isDark ? Colors.white : Colors.black;
    final sheetTextColor = isDark ? Colors.black : Colors.white;
    final buttonColor = isDark ? Colors.black : Colors.white;
    final buttonTextColor = isDark ? Colors.white : Colors.black;
    final preview = (article.content?.trim().isNotEmpty == true
            ? article.content
            : article.description) ??
        'No article preview available.';

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        top: false,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(sheetContext).size.height * .78,
          ),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: sheetColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: sheetTextColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: _ArticlePreviewImage(url: article.urlToImage),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    preview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: sheetTextColor, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: buttonTextColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ArticleDetailView(article: article),
                      ),
                    );
                  },
                  child: const Text('View Full Article'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticlePreviewImage extends StatelessWidget {
  final String? url;

  const _ArticlePreviewImage({this.url});

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim() ?? '';
    if (imageUrl.isEmpty) {
      return const ColoredBox(
        color: Colors.black12,
        child: Center(child: Icon(Icons.image_not_supported_outlined)),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder: (_, __) => const ColoredBox(
        color: Colors.black12,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (_, __, ___) => const ColoredBox(
        color: Colors.black12,
        child: Center(child: Icon(Icons.broken_image_outlined)),
      ),
    );
  }
}
