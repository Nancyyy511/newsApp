class NewsModel {
  final String id;
  final String title;
  final String? imageUrl;
  final String? author;
  final DateTime publishedAt;

  const NewsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
  });
}
