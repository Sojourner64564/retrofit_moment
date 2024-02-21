// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/data/data_source/data_source_latest_news/data_source_latest_news.dart'
    as _i3;
import '../../features/data/network/internet_connection_checker.dart' as _i15;
import '../../features/data/network/network_info.dart' as _i5;
import '../../features/data/network/network_info_impl.dart' as _i6;
import '../../features/data/repository/latest_news_repository_impl.dart' as _i11;
import '../../features/data/repository/search_news_repository_impl.dart' as _i8;
import '../../features/domain/repository/latest_news_repository.dart' as _i10;
import '../../features/domain/repository/search_news_repository.dart' as _i7;
import '../../features/domain/usecase/latest_news_use_case.dart' as _i12;
import '../../features/domain/usecase/search_news_use_case.dart' as _i9;
import '../../features/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i14;
import '../../features/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.SearchNewsRepository>(() => _i8.SearchNewsRepositoryImpl(
        get<_i5.NetworkInfo>(),
        get<_i3.ClientDataSourceRemouteApi>(),
      ));
  gh.factory<_i9.SearchNewsUseCase>(
      () => _i9.SearchNewsUseCase(get<_i7.SearchNewsRepository>()));
  gh.lazySingleton<_i10.LatestNewsRepository>(
      () => _i11.LatestNewsRepositoryImpl(
            get<_i5.NetworkInfo>(),
            get<_i3.ClientDataSourceRemouteApi>(),
          ));
  gh.factory<_i12.LatestNewsUseCaseImpl>(
      () => _i12.LatestNewsUseCaseImpl(get<_i10.LatestNewsRepository>()));
  gh.factory<_i13.SearchNewsCubit>(
      () => _i13.SearchNewsCubit(get<_i9.SearchNewsUseCase>()));
  gh.lazySingleton<_i14.LatestNewsCubit>(
      () => _i14.LatestNewsCubit(get<_i12.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i15.RegisterModuleConnectionChecker {}
