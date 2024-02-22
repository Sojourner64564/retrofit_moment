// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../../features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart'
    as _i4;
import '../../features/latest_news_feature/data/repository/latest_news_repository_impl.dart'
    as _i12;
import '../../features/latest_news_feature/domain/repository/latest_news_repository.dart'
    as _i11;
import '../../features/latest_news_feature/domain/usecase/latest_news_use_case.dart'
    as _i13;
import '../../features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i15;
import '../../features/search_news_feature/data/data_source/search_news_data_source_remote.dart'
    as _i7;
import '../../features/search_news_feature/data/repository/search_news_repository_impl.dart'
    as _i9;
import '../../features/search_news_feature/domain/repository/search_news_repository.dart'
    as _i8;
import '../../features/search_news_feature/domain/usecase/search_news_use_case.dart'
    as _i10;
import '../../features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i14;
import '../network/internet_connection_checker.dart' as _i16;
import '../network/network_info.dart' as _i5;
import '../network/network_info_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.factory<_i4.LatestNewsClientDataSourceRemote>(
      () => _i4.LatestNewsClientDataSourceRemote());
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.factory<_i7.SearchNewsClientDataSourceRemote>(
      () => _i7.SearchNewsClientDataSourceRemote());
  gh.lazySingleton<_i8.SearchNewsRepository>(() => _i9.SearchNewsRepositoryImpl(
        get<_i5.NetworkInfo>(),
        get<_i7.SearchNewsClientDataSourceRemote>(),
      ));
  gh.factory<_i10.SearchNewsUseCase>(
      () => _i10.SearchNewsUseCase(get<_i8.SearchNewsRepository>()));
  gh.lazySingleton<_i11.LatestNewsRepository>(
      () => _i12.LatestNewsRepositoryImpl(
            get<_i5.NetworkInfo>(),
            get<_i4.LatestNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i13.LatestNewsUseCaseImpl>(
      () => _i13.LatestNewsUseCaseImpl(get<_i11.LatestNewsRepository>()));
  gh.factory<_i14.SearchNewsCubit>(
      () => _i14.SearchNewsCubit(get<_i10.SearchNewsUseCase>()));
  gh.lazySingleton<_i15.LatestNewsCubit>(
      () => _i15.LatestNewsCubit(get<_i13.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i16.RegisterModuleConnectionChecker {}
