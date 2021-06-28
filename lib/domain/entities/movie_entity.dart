import 'package:equatable/equatable.dart';

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
}
