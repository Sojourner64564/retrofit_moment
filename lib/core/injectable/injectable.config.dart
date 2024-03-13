// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart'
    as _i5;
import '../../features/latest_news_feature/data/repository/latest_news_repository_impl.dart'
    as _i16;
import '../../features/latest_news_feature/domain/repository/latest_news_repository.dart'
    as _i15;
import '../../features/latest_news_feature/domain/usecase/latest_news_use_case.dart'
    as _i17;
import '../../features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i19;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart'
    as _i10;
import '../../features/search_news_feature/data/data_source/search_news_data_source_remote.dart'
    as _i9;
import '../../features/search_news_feature/data/repository/search_news_repository_impl.dart'
    as _i12;
import '../../features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart'
    as _i3;
import '../../features/search_news_feature/domain/repository/search_news_repository.dart'
    as _i11;
import '../../features/search_news_feature/domain/usecase/search_news_use_case.dart'
    as _i13;
import '../../features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart'
    as _i8;
import '../../features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i18;
import '../../features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart'
    as _i14;
import '../network/internet_connection_checker.dart' as _i20;
import '../network/network_info.dart' as _i6;
import '../network/network_info_impl.dart'
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
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  gh.lazySingleton<_i3.Database>(() => _i3.Database());
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.factory<_i5.LatestNewsClientDataSourceRemote>(
      () => _i5.LatestNewsClientDataSourceRemote());
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i8.SaveNewsToPhoneCubit>(() => _i8.SaveNewsToPhoneCubit());
  gh.factory<_i9.SearchNewsClientDataSourceRemote>(
      () => _i9.SearchNewsClientDataSourceRemote());
  gh.lazySingleton<_i10.SearchNewsDataSourceLocalImpl>(
      () => _i10.SearchNewsDataSourceLocalImpl());
  gh.lazySingleton<_i11.SearchNewsRepository>(
      () => _i12.SearchNewsRepositoryImpl(
            get<_i6.NetworkInfo>(),
            get<_i9.SearchNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i13.SearchNewsUseCase>(
      () => _i13.SearchNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.lazySingleton<_i14.UpdateSearchNewsListCubit>(
      () => _i14.UpdateSearchNewsListCubit());
  gh.lazySingleton<_i15.LatestNewsRepository>(
      () => _i16.LatestNewsRepositoryImpl(
            get<_i6.NetworkInfo>(),
            get<_i5.LatestNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i17.LatestNewsUseCaseImpl>(
      () => _i17.LatestNewsUseCaseImpl(get<_i15.LatestNewsRepository>()));
  gh.lazySingleton<_i18.SearchNewsCubit>(
      () => _i18.SearchNewsCubit(get<_i13.SearchNewsUseCase>()));
  gh.lazySingleton<_i19.LatestNewsCubit>(
      () => _i19.LatestNewsCubit(get<_i17.LatestNewsUseCaseImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i20.RegisterModuleConnectionChecker {}
