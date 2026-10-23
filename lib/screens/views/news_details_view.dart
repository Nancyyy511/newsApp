import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/widgets/news/new_cards.dart';

class NewsDetailesView extends StatelessWidget {
  const NewsDetailesView({super.key});

  static const List<String> sources = [
    'ABC News',
    'Aftenposten',
    'ANSA.it',
    'Ary News',
    'Axios',
    'BBC News',
    'CNN',
  ];

  @override
  Widget build(BuildContext context) {
    final sampleNews = [
      NewsModel(
        id: '1',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        imageUrl: 'https://www.magnific.com/free-photos-vectors/testing',
        author: 'Jon Haworth',
        publishedAt: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      NewsModel(
        id: '2',
        title:
            'Nobel Prize in physics awarded to two scientists for machine learning discoveries',
        imageUrl: 'https://www.magnific.com/free-photos-vectors/testing',
        author: 'DANIEL NIEMANN Associated Press',
        publishedAt: DateTime.now().subtract(const Duration(minutes: 18)),
      ),
    ];

    return DefaultTabController(
      length: sources.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).colorScheme.onSurface,
                dividerHeight: 0,
                labelColor: Theme.of(context).colorScheme.onSurface,
                unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                tabs: sources.map((source) {
                  return Tab(text: source);
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources.map((source) {
                    return _buildTabView(sampleNews);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTabView(List<NewsModel> newsList) {
  return ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: newsList.length,
    itemBuilder: (context, index) {
      return NewsCard(news: newsList[index]);
    },
    separatorBuilder: (context, index) {
      return SizedBox(height: 16.h);
    },
  );
}
