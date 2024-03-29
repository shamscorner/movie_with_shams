part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<dynamic> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity>? movies;

  SearchMovieLoaded(this.movies);

  @override
  List<dynamic> get props => [movies];
}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieError extends SearchMovieState {
  final AppErrorType errorType;

  SearchMovieError(this.errorType);

  @override
  List<dynamic> get props => [errorType];
}
