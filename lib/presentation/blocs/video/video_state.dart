part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<dynamic> get props => [];
}

class VideoInitial extends VideoState {}

class NoVideos extends VideoState {}

class VideosLoaded extends VideoState {
  final List<VideoEntity>? videos;

  VideosLoaded(this.videos);

  @override
  List<dynamic> get props => [videos];
}
