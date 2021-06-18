import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}