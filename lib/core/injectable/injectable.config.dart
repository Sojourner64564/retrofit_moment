// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../../feature/data/data_source/data_source_latest_news/data_source_latest_news.dart'
    as _i7;
import '../../feature/data/network/internet_connection_checker.dart' as _i10;
import '../../feature/data/network/network_info.dart' as _i4;
import '../../feature/data/network/network_info_impl.dart' as _i5;
import '../../feature/data/repository/latest_news_repository_impl.dart' as _i6;
import '../../feature/domain/usecase/latest_news_use_case.dart' as _i8;
import '../../feature/presentation/cubit/test_cubit/test_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  final dataSourceLatestNewsModule = _$DataSourceLatestNewsModule();
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i4.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.factory<_DataSourceLatestNews>(
      () => dataSourceLatestNewsModule.getService());
  gh.factory<_i6.LatestNewsRepositoryImpl>(() => _i6.LatestNewsRepositoryImpl(
        get<_i4.NetworkInfo>(),
        get<_i7.DataSourceLatestNews>(),
      ));
  gh.factory<_i8.LatestNewsUseCaseImpl>(
      () => _i8.LatestNewsUseCaseImpl(get<_i6.LatestNewsRepositoryImpl>()));
  gh.factory<_i9.TestCubit>(
      () => _i9.TestCubit(get<_i8.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i10.RegisterModuleConnectionChecker {}

class _$DataSourceLatestNewsModule extends _i7.DataSourceLatestNewsModule {}
