import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/movie_params.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/usecase.dart';

class CheckIfMovieIsFavorite extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfMovieIsFavorite(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieIsFavorite(movieParams.id);
  }
}
