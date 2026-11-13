import 'package:news_app/news/model/data_source/main_layer_source.dart';
import 'package:news_app/news/model/network/network_services.dart';
import 'package:news_app/news/repository/main_layer_reporsitery.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';

class ServiceLocator {
  static final MainLayerDataSource _dataSource = NetworkDataSource();
  static final MainLayerRepository _repository = MainLayerRepository(
    dataSource: _dataSource,
  );
  static final MainLayerCubit mainLayerCubit = MainLayerCubit(
    mainLayerRepository: _repository,
  );
}
