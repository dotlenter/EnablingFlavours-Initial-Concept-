// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../modules/date/data/date_datasource.dart' as _i4;
import 'factories/register_module.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyRegisterModule = _$ThirdPartyRegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => thirdPartyRegisterModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i4.DateDataSource>(() =>
      _i4.DateDataSource(sharedPreferences: get<_i3.SharedPreferences>()));
  return get;
}

class _$ThirdPartyRegisterModule extends _i5.ThirdPartyRegisterModule {}
