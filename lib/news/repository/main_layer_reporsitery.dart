import 'package:injectable/injectable.dart';
import 'package:news_app/common/errors/error_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/model/data_source/main_layer_source.dart';

@injectable
class MainLayerRepository {
  final MainLayerDataSource _dataSource;

  MainLayerRepository({required MainLayerDataSource dataSource})
    : _dataSource = dataSource;
  Future<(ErrorModel?, List<Sources>?)> getSources(String categoryId) async {
    return _dataSource.getSources(categoryId);
  }

  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) async {
    return _dataSource.getArticles(sourceId);
  }
}
