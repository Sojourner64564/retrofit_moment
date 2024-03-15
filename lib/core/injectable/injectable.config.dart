// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart'
    as _i6;
import '../../features/latest_news_feature/data/repository/latest_news_repository_impl.dart'
    as _i18;
import '../../features/latest_news_feature/domain/repository/latest_news_repository.dart'
    as _i17;
import '../../features/latest_news_feature/domain/usecase/latest_news_use_case.dart'
    as _i19;
import '../../features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i27;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local.dart'
    as _i10;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart'
    as _i11;
import '../../features/search_news_feature/data/data_source/search_news_data_source_remote.dart'
    as _i9;
import '../../features/search_news_feature/data/repository/search_news_repository_impl.dart'
    as _i13;
import '../../features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart'
    as _i4;
import '../../features/search_news_feature/domain/repository/search_news_repository.dart'
    as _i12;
import '../../features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart'
    as _i16;
import '../../features/search_news_feature/domain/usecase/lenght_search_news_use_case.dart'
    as _i20;
import '../../features/search_news_feature/domain/usecase/load_saved_search_news_use_case.dart'
    as _i21;
import '../../features/search_news_feature/domain/usecase/load_search_news_all_news_use_case.dart'
    as _i22;
import '../../features/search_news_feature/domain/usecase/save_search_news_model_void_use_case.dart'
    as _i24;
import '../../features/search_news_feature/domain/usecase/search_news_use_case.dart'
    as _i14;
import '../../features/search_news_feature/domain/usecase/select_search_news_last_model_use_case.dart'
    as _i15;
import '../../features/search_news_feature/presentation/cubit/load_search_news_cubit/load_search_news_cubit.dart'
    as _i23;
import '../../features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart'
    as _i28;
import '../../features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i25;
import '../../features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart'
    as _i26;
import '../network/internet_connection_checker.dart' as _i29;
import '../network/network_info.dart' as _i7;
import '../network/network_info_impl.dart' as _i8;
import '../route/route.dart' as _i3; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.Database>(() => _i4.Database());
  gh.factory<_i5.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.factory<_i6.LatestNewsClientDataSourceRemote>(
      () => _i6.LatestNewsClientDataSourceRemote());
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.factory<_i9.SearchNewsClientDataSourceRemote>(
      () => _i9.SearchNewsClientDataSourceRemote());
  gh.lazySingleton<_i10.SearchNewsDataSourceLocal>(
      () => _i11.SearchNewsDataSourceLocalImpl());
  gh.lazySingleton<_i12.SearchNewsRepository>(
      () => _i13.SearchNewsRepositoryImpl(
            get<_i7.NetworkInfo>(),
            get<_i9.SearchNewsClientDataSourceRemote>(),
            get<_i10.SearchNewsDataSourceLocal>(),
          ));
  gh.factory<_i14.SearchNewsUseCase>(
      () => _i14.SearchNewsUseCase(get<_i12.SearchNewsRepository>()));
  gh.factory<_i15.SelectSearchNewsLastModelUseCase>(() =>
      _i15.SelectSearchNewsLastModelUseCase(get<_i12.SearchNewsRepository>()));
  gh.factory<_i16.GetDbSearchNewsUseCase>(
      () => _i16.GetDbSearchNewsUseCase(get<_i12.SearchNewsRepository>()));
  gh.lazySingleton<_i17.LatestNewsRepository>(
      () => _i18.LatestNewsRepositoryImpl(
            get<_i7.NetworkInfo>(),
            get<_i6.LatestNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i19.LatestNewsUseCaseImpl>(
      () => _i19.LatestNewsUseCaseImpl(get<_i17.LatestNewsRepository>()));
  gh.factory<_i20.LenghtSearchNewsUseCase>(
      () => _i20.LenghtSearchNewsUseCase(get<_i12.SearchNewsRepository>()));
  gh.factory<_i21.LoadSavedSearchNewsUseCase>(
      () => _i21.LoadSavedSearchNewsUseCase(get<_i12.SearchNewsRepository>()));
  gh.factory<_i22.LoadSearchNewsAllNewsUseCase>(() =>
      _i22.LoadSearchNewsAllNewsUseCase(get<_i12.SearchNewsRepository>()));
  gh.lazySingleton<_i23.LoadSearchNewsCubit>(() => _i23.LoadSearchNewsCubit(
        get<_i21.LoadSavedSearchNewsUseCase>(),
        get<_i16.GetDbSearchNewsUseCase>(),
      ));
  gh.factory<_i24.SaveSearchNewsModelVoidUseCase>(() =>
      _i24.SaveSearchNewsModelVoidUseCase(get<_i12.SearchNewsRepository>()));
  gh.lazySingleton<_i25.SearchNewsCubit>(
      () => _i25.SearchNewsCubit(get<_i14.SearchNewsUseCase>()));
  gh.lazySingleton<_i26.UpdateSearchNewsListCubit>(
      () => _i26.UpdateSearchNewsListCubit(
            get<_i16.GetDbSearchNewsUseCase>(),
            get<_i20.LenghtSearchNewsUseCase>(),
            get<_i22.LoadSearchNewsAllNewsUseCase>(),
          ));
  gh.lazySingleton<_i27.LatestNewsCubit>(
      () => _i27.LatestNewsCubit(get<_i19.LatestNewsUseCaseImpl>()));
  gh.lazySingleton<_i28.SaveNewsToPhoneCubit>(() => _i28.SaveNewsToPhoneCubit(
        get<_i16.GetDbSearchNewsUseCase>(),
        get<_i24.SaveSearchNewsModelVoidUseCase>(),
        get<_i15.SelectSearchNewsLastModelUseCase>(),
        get<_i20.LenghtSearchNewsUseCase>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i29.RegisterModuleConnectionChecker {}
