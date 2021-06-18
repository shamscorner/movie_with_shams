import 'dart:convert';

import 'package:movie_with_shams/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? video;
  final String title;
  final String? overview;
  final String? releaseDate;
  final int id;
  final bool? adult;
  final String? backdropPath;
  // final List<int>? genreIds;
  final int? voteCount;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final double voteAverage;
  final double? popularity;
  final String? mediaType;

  MovieModel({
    this.video,
    required this.title,
    this.overview,
    this.releaseDate,
    required this.id,
    this.adult,
    this.backdropPath,
    // this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    required this.voteAverage,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          voteAverage: voteAverage,
          overview: overview,
        );

  Map<String, dynamic> toMap() {
    return {
      'video': video,
      'title': title,
      'overview': overview,
      'releaseDate': releaseDate,
      'id': id,
      'adult': adult,
      'backdropPath': backdropPath,
      // 'genreIds': genreIds,
      'voteCount': voteCount,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'popularity': popularity,
      'mediaType': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      video: map['video'],
      title: map['title'],
      overview: map['overview'],
      releaseDate: map['releaseDate'],
      id: map['id'],
      adult: map['adult'],
      backdropPath: map['backdropPath'],
      // genreIds: List<int>.from(map['genreIds']),
      voteCount: map['voteCount'],
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      posterPath: map['posterPath'],
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      mediaType: map['mediaType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
