import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
configureDependencies() => getIt.init(); // this function is tresponsible for creating the object
