import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:physical_transformation_test_app/di/injectable_init.config.dart';

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() {

  return $initGetIt(getIt);
}