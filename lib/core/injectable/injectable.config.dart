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
    as _i17;
import '../../features/latest_news_feature/domain/repository/latest_news_repository.dart'
    as _i16;
import '../../features/latest_news_feature/domain/usecase/latest_news_use_case.dart'
    as _i18;
import '../../features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart'
    as _i26;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local.dart'
    as _i9;
import '../../features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart'
    as _i10;
import '../../features/search_news_feature/data/data_source/search_news_data_source_remote.dart'
    as _i8;
import '../../features/search_news_feature/data/repository/search_news_repository_impl.dart'
    as _i12;
import '../../features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart'
    as _i3;
import '../../features/search_news_feature/domain/repository/search_news_repository.dart'
    as _i11;
import '../../features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart'
    as _i15;
import '../../features/search_news_feature/domain/usecase/lenght_search_news_use_case.dart'
    as _i19;
import '../../features/search_news_feature/domain/usecase/load_saved_search_news_use_case.dart'
    as _i20;
import '../../features/search_news_feature/domain/usecase/load_search_news_all_news_use_case.dart'
    as _i21;
import '../../features/search_news_feature/domain/usecase/save_search_news_model_void_use_case.dart'
    as _i23;
import '../../features/search_news_feature/domain/usecase/search_news_use_case.dart'
    as _i13;
import '../../features/search_news_feature/domain/usecase/select_search_news_last_model_use_case.dart'
    as _i14;
import '../../features/search_news_feature/presentation/cubit/load_search_news_cubit/load_search_news_cubit.dart'
    as _i22;
import '../../features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart'
    as _i27;
import '../../features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart'
    as _i24;
import '../../features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart'
    as _i25;
import '../network/internet_connection_checker.dart' as _i28;
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
  gh.factory<_i8.SearchNewsClientDataSourceRemote>(
      () => _i8.SearchNewsClientDataSourceRemote());
  gh.lazySingleton<_i9.SearchNewsDataSourceLocal>(
      () => _i10.SearchNewsDataSourceLocalImpl());
  gh.lazySingleton<_i11.SearchNewsRepository>(
      () => _i12.SearchNewsRepositoryImpl(
            get<_i6.NetworkInfo>(),
            get<_i8.SearchNewsClientDataSourceRemote>(),
            get<_i9.SearchNewsDataSourceLocal>(),
          ));
  gh.factory<_i13.SearchNewsUseCase>(
      () => _i13.SearchNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.factory<_i14.SelectSearchNewsLastModelUseCase>(() =>
      _i14.SelectSearchNewsLastModelUseCase(get<_i11.SearchNewsRepository>()));
  gh.factory<_i15.GetDbSearchNewsUseCase>(
      () => _i15.GetDbSearchNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.lazySingleton<_i16.LatestNewsRepository>(
      () => _i17.LatestNewsRepositoryImpl(
            get<_i6.NetworkInfo>(),
            get<_i5.LatestNewsClientDataSourceRemote>(),
          ));
  gh.factory<_i18.LatestNewsUseCaseImpl>(
      () => _i18.LatestNewsUseCaseImpl(get<_i16.LatestNewsRepository>()));
  gh.factory<_i19.LenghtSearchNewsUseCase>(
      () => _i19.LenghtSearchNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.factory<_i20.LoadSavedSearchNewsUseCase>(
      () => _i20.LoadSavedSearchNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.factory<_i21.LoadSearchNewsAllNewsUseCase>(() =>
      _i21.LoadSearchNewsAllNewsUseCase(get<_i11.SearchNewsRepository>()));
  gh.lazySingleton<_i22.LoadSearchNewsCubit>(() => _i22.LoadSearchNewsCubit(
        get<_i20.LoadSavedSearchNewsUseCase>(),
        get<_i15.GetDbSearchNewsUseCase>(),
      ));
  gh.factory<_i23.SaveSearchNewsModelVoidUseCase>(() =>
      _i23.SaveSearchNewsModelVoidUseCase(get<_i11.SearchNewsRepository>()));
  gh.lazySingleton<_i24.SearchNewsCubit>(
      () => _i24.SearchNewsCubit(get<_i13.SearchNewsUseCase>()));
  gh.lazySingleton<_i25.UpdateSearchNewsListCubit>(
      () => _i25.UpdateSearchNewsListCubit(
            get<_i15.GetDbSearchNewsUseCase>(),
            get<_i19.LenghtSearchNewsUseCase>(),
            get<_i21.LoadSearchNewsAllNewsUseCase>(),
          ));
  gh.lazySingleton<_i26.LatestNewsCubit>(
      () => _i26.LatestNewsCubit(get<_i18.LatestNewsUseCaseImpl>()));
  gh.lazySingleton<_i27.SaveNewsToPhoneCubit>(() => _i27.SaveNewsToPhoneCubit(
        get<_i15.GetDbSearchNewsUseCase>(),
        get<_i23.SaveSearchNewsModelVoidUseCase>(),
        get<_i14.SelectSearchNewsLastModelUseCase>(),
        get<_i19.LenghtSearchNewsUseCase>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i28.RegisterModuleConnectionChecker {}
