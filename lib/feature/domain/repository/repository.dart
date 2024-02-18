import 'package:retrofit_moment/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Repository<Type, ParamsType>{
  Future<Either<Failure, Type>> fetchDataFromSource(ParamsType params);
}