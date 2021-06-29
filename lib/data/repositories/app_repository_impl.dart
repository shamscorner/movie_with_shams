import 'package:movie_with_shams/data/data_sources/language_local_data_source.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String languageCode) async {
    try {
      final response =
          await languageLocalDataSource.updateLanguage(languageCode);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
