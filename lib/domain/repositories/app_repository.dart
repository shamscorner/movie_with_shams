import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String languageCode);
  Future<Either<AppError, String>> getPreferredLanguage();
}
