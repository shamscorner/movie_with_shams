import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';

import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/movie_params.dart';
import 'package:movie_with_shams/domain/entities/no_params.dart';
import 'package:movie_with_shams/domain/usecases/check_if_movie_is_favorite.dart';
import 'package:movie_with_shams/domain/usecases/delete_favotire_movie.dart';
import 'package:movie_with_shams/domain/usecases/get_favorite_movies.dart';
import 'package:movie_with_shams/domain/usecases/save_favorite_movie.dart';

part 'favorite_movie_event.dart';
part 'favorite_movie_state.dart';

class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState> {
  final SaveFavoriteMovie saveFavoriteMovie;
  final GetFavotireMovies getFavotireMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfMovieIsFavorite checkIfMovieIsFavorite;

  FavoriteMovieBloc({
    required this.saveFavoriteMovie,
    required this.getFavotireMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfMovieIsFavorite,
  }) : super(FavoriteMovieInitial());

  @override
  Stream<FavoriteMovieState> mapEventToState(
    FavoriteMovieEvent event,
  ) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveFavoriteMovie(event.movieEntity);
      }

      final response =
          await checkIfMovieIsFavorite(MovieParams(event.movieEntity.id));
      yield response.fold(
        (l) => FavoriteMovieError(),
        (isFavorite) => IsFavoriteMovie(isFavorite),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fetchFavoriteMovies();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(event.movieId));
      yield* _fetchFavoriteMovies();
    } else if (event is CheckIfFavoriteMovieEvent) {
      final response = await checkIfMovieIsFavorite(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMovieError(),
        (isFavorite) => IsFavoriteMovie(isFavorite),
      );
    }
  }

  Stream<FavoriteMovieState> _fetchFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavotireMovies(NoParams());

    yield response.fold(
      (l) => FavoriteMovieError(),
      (movies) => FavoriteMovieLoaded(movies),
    );
  }
}
