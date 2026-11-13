import 'package:news_app/common/errors/error_model.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';

abstract class MainLayerDataSource {
  Future<(ErrorModel?, List<Sources>?)> getSources(String category);

  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId);
}
