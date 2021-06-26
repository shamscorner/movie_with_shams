import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:movie_with_shams/domain/entities/movie_params.dart';
import 'package:movie_with_shams/domain/entities/video_entity.dart';
import 'package:movie_with_shams/domain/usecases/get_videos.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideos getVideos;

  VideoBloc({
    required this.getVideos,
  }) : super(VideoInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is LoadVideosEvent) {
      final Either<AppError, List<VideoEntity>?> eitherVideoResponse =
          await getVideos(MovieParams(event.movieId));

      yield eitherVideoResponse.fold(
        (l) => NoVideos(),
        (videos) => VideosLoaded(videos),
      );
    }
  }
}
