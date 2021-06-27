import 'package:dartz/dartz.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/movie_search_params.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/usecase.dart';

class GetSearchedMovies extends UseCase<List<MovieEntity>?, MovieSearchParams> {
  final MovieRepository repository;

  GetSearchedMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>?>> call(
      MovieSearchParams movieSearchParams) async {
    return await repository.getSearchedMovies(movieSearchParams.searchTerm);
  }
}
