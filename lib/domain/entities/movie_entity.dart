import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String posterPath;
  final String? backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String? overview;

  const MovieEntity({
    required this.id,
    required this.posterPath,
    this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
