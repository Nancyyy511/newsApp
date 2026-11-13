import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/model/data_models/article_response_model/article_response_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
//import 'package:news_app/news/model/network/network_services.dart';
import 'package:news_app/news/repository/main_layer_reporsitery.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

@injectable
class MainLayerCubit extends Cubit<MainLayerState> {
  MainLayerCubit({required this._mainLayerRepository})
    : super(MainLayerInitialState());
  final MainLayerRepository _mainLayerRepository;

  // The sources of the selected category. The tabs are built from this list,
  // so they stay on screen while articles are loading.
  List<Sources> sources = [];
  CategoryEnum? selectedCategory;

  // The source (tab) whose articles the user is looking at right now.
  String? selectedSourceId;

  // Articles that were already loaded, saved by source ID,
  // so going back to a tab does not call the API again.
  final Map<String, List<Article>> _articlesCache = {};

  void selectCategory(CategoryEnum newCategory) {
    sources = [];
    selectedSourceId = null;
    _articlesCache.clear();

    emit(SelectCategoryState(categoryEnum: newCategory));
    getSources(newCategory);
  }

  // Back to the Home view: no category selected.
  // Requests that are still loading are ignored when they finish,
  // because the selected category and source are cleared here.
  void goHome() {
    sources = [];
    selectedSourceId = null;
    _articlesCache.clear();

    emit(MainLayerInitialState());
  }

  Future<void> getSources(CategoryEnum category) async {
    selectedCategory = category;
    emit(GetSourcesLoading(categoryEnum: category));

    final (error, sourcesList) = await _mainLayerRepository.getSources(
      category.name,
    );

    // Ignore this response if the cubit was closed, or if the user already
    // selected another category while this request was still loading.
    if (isClosed || state.categoryEnum != category) return;

    if (error != null) {
      emit(
        GetSourcesError(errorMessage: error.message, categoryEnum: category),
      );
      return;
    }

    sources = sourcesList ?? [];
    emit(GetSourcesSuccess(sources: sources, categoryEnum: category));
  }

  Future<void> getArticles(String sourceId) async {
    final CategoryEnum? category = state.categoryEnum;

    // This source is already loading or already shown: no new request needed.
    final bool isSameSource = sourceId == selectedSourceId;
    if (isSameSource &&
        (state is GetArticlesLoading || state is GetArticlesSuccess)) {
      return;
    }

    selectedSourceId = sourceId;

    // Articles of this source were loaded before: show them without the API.
    final List<Article>? cachedArticles = _articlesCache[sourceId];
    if (cachedArticles != null) {
      emit(
        GetArticlesSuccess(
          categoryEnum: category,
          sourceId: sourceId,
          articles: cachedArticles,
        ),
      );
      return;
    }

    emit(GetArticlesLoading(categoryEnum: category, sourceId: sourceId));

    final (error, articles) = await _mainLayerRepository.getArticles(sourceId);

    if (isClosed) return;

    // Save successful results, even if the user already moved to another tab.
    if (error == null) {
      _articlesCache[sourceId] = articles ?? [];
    }

    // The user selected another tab while this request was loading:
    // do not replace the articles of the tab that is shown now.
    if (selectedSourceId != sourceId) return;

    if (error != null) {
      emit(
        GetArticlesError(
          categoryEnum: category,
          sourceId: sourceId,
          errorMessage: error.message,
        ),
      );
      return;
    }

    emit(
      GetArticlesSuccess(
        categoryEnum: category,
        sourceId: sourceId,
        articles: articles ?? [],
      ),
    );
  }
}
