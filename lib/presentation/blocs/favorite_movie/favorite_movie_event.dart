part of 'favorite_movie_bloc.dart';

abstract class FavoriteMovieEvent extends Equatable {
  const FavoriteMovieEvent();
}

class LoadFavoriteMovieEvent extends FavoriteMovieEvent {
  @override
  List<Object?> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoriteMovieEvent {
  final int movieId;

  DeleteFavoriteMovieEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteMovieEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  ToggleFavoriteMovieEvent(this.movieEntity, this.isFavorite);

  @override
  List<Object?> get props => [movieEntity, isFavorite];
}

class CheckIfFavoriteMovieEvent extends FavoriteMovieEvent {
  final int movieId;

  CheckIfFavoriteMovieEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
