import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/injectable/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

