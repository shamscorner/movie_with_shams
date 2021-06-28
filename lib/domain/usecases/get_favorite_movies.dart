import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/no_params.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/usecase.dart';

class GetFavotireMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavotireMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}
