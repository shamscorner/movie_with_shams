import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/movie_search_params.dart';
import 'package:movie_with_shams/domain/usecases/get_searched_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchedMovies getSearchedMovies;

  SearchMovieBloc({
    required this.getSearchedMovies,
  }) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();

        final Either<AppError, List<MovieEntity>?> response =
            await getSearchedMovies(
                MovieSearchParams(searchTerm: event.searchTerm));
        yield response.fold(
          (l) => SearchMovieError(),
          (movies) => SearchMovieLoaded(movies),
        );
      }
    }
  }
}
