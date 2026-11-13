import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';

class ArticleDetailView extends StatelessWidget {
  final Article article;

  const ArticleDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = theme.colorScheme.onSurface;
    final body = [article.description, article.content]
        .where((part) => part?.trim().isNotEmpty == true)
        .map((part) => part!.trim())
        .toList();
    final imageUrl = article.urlToImage?.trim() ?? '';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Article Details')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const ColoredBox(
                      color: Colors.black12,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (_, __, ___) => const ColoredBox(
                      color: Colors.black12,
                      child: Center(child: Icon(Icons.broken_image_outlined)),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              article.title ?? 'Untitled article',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: foreground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              [
                if (article.author?.trim().isNotEmpty == true)
                  article.author!.trim(),
                if (article.source?.name?.trim().isNotEmpty == true)
                  article.source!.name!.trim(),
              ].join(' · '),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: foreground.withValues(alpha: .65),
              ),
            ),
            const SizedBox(height: 20),
            if (body.isEmpty)
              Text('No article content available.',
                  style: theme.textTheme.bodyLarge?.copyWith(color: foreground))
            else
              ...body.map(
                (paragraph) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    paragraph,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: foreground,
                      height: 1.55,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
