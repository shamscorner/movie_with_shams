import 'package:equatable/equatable.dart';
import 'package:movie_with_shams/domain/entities/movie_details_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  const MovieEntity({
    required this.id,
    this.posterPath,
    this.backdropPath,
    required this.title,
    this.voteAverage,
    this.releaseDate,
    this.overview,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      id: movieDetailEntity.id,
      title: movieDetailEntity.title,
      posterPath: movieDetailEntity.posterPath,
      backdropPath: movieDetailEntity.backdropPath,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
      overview: movieDetailEntity.overview,
    );
  }
}
