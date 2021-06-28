import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/usecase.dart';

class SaveFavoriteMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity movieEntity) async {
    return await movieRepository.saveMovie(movieEntity);
  }
}
