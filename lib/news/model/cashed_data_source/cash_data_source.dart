import 'package:news_app/common/errors/error_model.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/data_source/main_layer_source.dart';

class CashDataSource extends MainLayerDataSource {
  @override
  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<(ErrorModel?, List<Sources>?)> getSources(String category) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
