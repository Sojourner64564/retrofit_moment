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
    as _i14;
import '../../features/latest_news_feature/domain/repository/latest_news_repository.dart'
    as _i13;
import '../../features/latest_news_feature/domain/usecase/latest_news_use_case.dart'
    as _i15;
import '../../features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i17;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart'
    as _i9;
import '../../features/search_news_feature/data/data_source/search_news_data_source_remote.dart'
    as _i8;
import '../../features/search_news_feature/data/repository/search_news_repository_impl.dart'
    as _i11;
import '../../features/search_news_feature/domain/repository/search_news_repository.dart'
    as _i10;
import '../../features/search_news_feature/domain/usecase/search_news_use_case.dart'
    as _i12;
import '../../features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart'
    as _i7;
import '../../features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i16;
import '../network/internet_connection_checker.dart' as _i18;
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
  gh.lazySingleton<_i7.SaveNewsToPhoneCubit>(() => _i7.SaveNewsToPhoneCubit());
  gh.factory<_i8.SearchNewsClientDataSourceRemote>(
      () => _i8.SearchNewsClientDataSourceRemote());
  gh.lazySingleton<_i9.SearchNewsDataSourceLocalImpl>(
      () => _i9.SearchNewsDataSourceLocalImpl());
  gh.lazySingleton<_i10.SearchNewsRepository>(
      () => _i11.SearchNewsRepositoryImpl(
            get<_i5.NetworkInfo>(),
            get<_i8.SearchNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i12.SearchNewsUseCase>(
      () => _i12.SearchNewsUseCase(get<_i10.SearchNewsRepository>()));
  gh.lazySingleton<_i13.LatestNewsRepository>(
      () => _i14.LatestNewsRepositoryImpl(
            get<_i5.NetworkInfo>(),
            get<_i4.LatestNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i15.LatestNewsUseCaseImpl>(
      () => _i15.LatestNewsUseCaseImpl(get<_i13.LatestNewsRepository>()));
  gh.lazySingleton<_i16.SearchNewsCubit>(
      () => _i16.SearchNewsCubit(get<_i12.SearchNewsUseCase>()));
  gh.lazySingleton<_i17.LatestNewsCubit>(
      () => _i17.LatestNewsCubit(get<_i15.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i18.RegisterModuleConnectionChecker {}
