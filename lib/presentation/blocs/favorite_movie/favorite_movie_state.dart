part of 'favorite_movie_bloc.dart';

abstract class FavoriteMovieState extends Equatable {
  const FavoriteMovieState();

  @override
  List<Object> get props => [];
}

class FavoriteMovieInitial extends FavoriteMovieState {}

class FavoriteMovieLoaded extends FavoriteMovieState {
  final List<MovieEntity> movies;

  FavoriteMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMovieError extends FavoriteMovieState {}

class IsFavoriteMovie extends FavoriteMovieState {
  final bool isFavorite;

  IsFavoriteMovie(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}
