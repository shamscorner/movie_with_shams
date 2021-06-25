import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';

import 'package:movie_with_shams/domain/entities/movie_details_entity.dart';
import 'package:movie_with_shams/domain/entities/movie_params.dart';
import 'package:movie_with_shams/domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc({
    required this.getMovieDetail,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (movie) => MovieDetailLoaded(movie),
      );
    }
  }
}
