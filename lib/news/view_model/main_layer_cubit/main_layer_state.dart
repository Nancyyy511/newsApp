import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';

abstract class MainLayerState {
  CategoryEnum? categoryEnum;

  MainLayerState({required this.categoryEnum});
}

class MainLayerInitialState extends MainLayerState {
  MainLayerInitialState() : super(categoryEnum: null);
}

class SelectCategoryState extends MainLayerState {
  SelectCategoryState({required super.categoryEnum});
}

class GetSourcesState extends MainLayerState {
  GetSourcesState({required super.categoryEnum});
}

class GetSourcesSuccess extends MainLayerState {
  final List<Sources> sources;

  GetSourcesSuccess({required super.categoryEnum, required this.sources});
}

class GetSourcesError extends MainLayerState {
  final String errorMessage;

  GetSourcesError({required super.categoryEnum, required this.errorMessage});
}

class GetSourcesLoading extends MainLayerState {
  GetSourcesLoading({required super.categoryEnum});
}

class GetArticlesState extends MainLayerState {
  GetArticlesState({required super.categoryEnum});
}

class GetArticlesSuccess extends MainLayerState {
  final String sourceId;
  final List<Article> articles;

  GetArticlesSuccess({
    required super.categoryEnum,
    required this.sourceId,
    required this.articles,
  });
}

class GetArticlesError extends MainLayerState {
  final String sourceId;
  final String errorMessage;

  GetArticlesError({
    required super.categoryEnum,
    required this.sourceId,
    required this.errorMessage,
  });
}

class GetArticlesLoading extends MainLayerState {
  final String sourceId;

  GetArticlesLoading({required super.categoryEnum, required this.sourceId});
}
