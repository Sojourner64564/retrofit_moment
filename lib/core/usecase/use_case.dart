import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';

abstract class UseCase<Type, TypeParams>{
  Future<Either<Failure, Type>> call(TypeParams params);
}