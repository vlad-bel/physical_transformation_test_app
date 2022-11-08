// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/mock_repository.dart' as _i4;
import '../domain/repository.dart' as _i3;
import '../interactor/login_interactor.dart' as _i5;
import '../interactor/login_interactor_impl.dart' as _i6;
import '../presentation/login/cubit/login_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.Repository>(_i4.MockRepository());
  gh.singleton<_i5.LoginInteractor>(
      _i6.LoginInteractorImpl(get<_i3.Repository>()));
  gh.singleton<_i7.LoginScreenCubit>(
      _i7.LoginScreenCubit(loginInteractor: get<_i5.LoginInteractor>()));
  return get;
}
