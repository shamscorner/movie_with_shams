part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class LoadVideosEvent extends VideoEvent {
  final int movieId;

  LoadVideosEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
