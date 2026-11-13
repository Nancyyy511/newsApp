import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/errors/error_model.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/common/network/end_points.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/news/model/data_source/main_layer_source.dart';

@Injectable(as: MainLayerDataSource)
class NetworkDataSource extends MainLayerDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseUrl,
      queryParameters: {'apiKey': AppConsts.apiKey},
    ),
  );

  // Get Sources by Category

  Future<(ErrorModel?, List<Sources>?)> getSources(String category) async {
    try {
      final Response response = await dio.get(
        EndPoints.sourcesEndpoint,
        queryParameters: {'category': category},
      );

      debugPrint('Category: $category');
      debugPrint('Sources response: ${response.data}');

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['status'] == 'ok') {
        final SourceModel sourceModel = SourceModel.fromJson(
          Map<String, dynamic>.from(response.data),
        );

        return (null, sourceModel.sources ?? []);
      }
      return (
        GeneralError(
          errorMessage: 'Failed to load sources.',
          errorCode: response.statusCode,
        ),
        null,
      );
    } on DioException catch (e) {
      final ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    } catch (e) {
      return (GeneralError(errorMessage: e.toString()), null);
    }
  }

  // Get Articles

  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) async {
    try {
      final Response response = await dio.get(
        EndPoints.articlesEndpoint,
        queryParameters: {'sources': sourceId},
      );

      debugPrint('Source ID: $sourceId');
      debugPrint('Articles response: ${response.data}');

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['status'] == 'ok') {
        final ArticleResponseModel articleResponseModel =
            ArticleResponseModel.fromMap(
              Map<String, dynamic>.from(response.data),
            );

        return (null, articleResponseModel.articles ?? []);
      }

      return (
        GeneralError(
          errorMessage: 'Failed to load articles.',
          errorCode: response.statusCode,
        ),
        null,
      );
    } on DioException catch (e) {
      final ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    } catch (e) {
      return (GeneralError(errorMessage: e.toString()), null);
    }
  }
}
