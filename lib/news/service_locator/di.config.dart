// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/news/model/data_source/main_layer_source.dart' as _i79;
import 'package:news_app/news/model/network/network_services.dart' as _i980;
import 'package:news_app/news/repository/main_layer_reporsitery.dart' as _i851;
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart'
    as _i754;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);

    gh.factory<_i79.MainLayerDataSource>(() => _i980.NetworkDataSource());

    gh.factory<_i851.MainLayerRepository>(
      () =>
          _i851.MainLayerRepository(dataSource: gh<_i79.MainLayerDataSource>()),
    );

    gh.factory<_i754.MainLayerCubit>(
      () => _i754.MainLayerCubit(
        mainLayerRepository: gh<_i851.MainLayerRepository>(),
      ),
    );

    return this;
  }
}
