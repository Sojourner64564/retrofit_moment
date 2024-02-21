import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:retrofit_moment/features/data/network/network_info.dart';

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo{
  NetworkInfoImpl(this.internetConnectionChecker);

  final InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}