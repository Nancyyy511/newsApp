import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/view/screens/widgets/news/new_cards.dart';
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
              return NewsCard(articles: articleList[index]);
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
}
