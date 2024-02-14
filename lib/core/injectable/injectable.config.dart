// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../feature/data/data_source/data_source_latest_news/data_source_latest_news.dart'
    as _i3;
import '../../feature/data/network/internet_connection_checker.dart' as _i13;
import '../../feature/data/network/network_info.dart' as _i5;
import '../../feature/data/network/network_info_impl.dart' as _i6;
import '../../feature/data/repository/latest_news_repository_impl.dart' as _i9;
import '../../feature/data/repository/search_news_repository_impl.dart' as _i7;
import '../../feature/domain/usecase/latest_news_use_case.dart' as _i10;
import '../../feature/domain/usecase/search_news_use_case.dart' as _i8;
import '../../feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i12;
import '../../feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.ClientDataSourceRemouteApi>(
      () => _i3.ClientDataSourceRemouteApi());
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.factory<_i7.SearchNewsRepositoryImpl>(() => _i7.SearchNewsRepositoryImpl(
        get<_i5.NetworkInfo>(),
        get<_i3.ClientDataSourceRemouteApi>(),
      ));
  gh.factory<_i8.SearchNewsUseCase>(
      () => _i8.SearchNewsUseCase(get<_i7.SearchNewsRepositoryImpl>()));
  gh.factory<_i9.LatestNewsRepositoryImpl>(() => _i9.LatestNewsRepositoryImpl(
        get<_i5.NetworkInfo>(),
        get<_i3.ClientDataSourceRemouteApi>(),
      ));
  gh.factory<_i10.LatestNewsUseCaseImpl>(
      () => _i10.LatestNewsUseCaseImpl(get<_i9.LatestNewsRepositoryImpl>()));
  gh.factory<_i11.SearchNewsCubit>(
      () => _i11.SearchNewsCubit(get<_i8.SearchNewsUseCase>()));
  gh.factory<_i12.LatestNewsCubit>(
      () => _i12.LatestNewsCubit(get<_i10.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i13.RegisterModuleConnectionChecker {}
