import 'dart:convert';

import 'package:movie_with_shams/data/models/movie/movie_model.dart';

class MoviesResultModel {
  List<MovieModel> movies;

  MoviesResultModel({
    required this.movies,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': movies.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesResultModel.fromMap(Map<String, dynamic> map) {
    return MoviesResultModel(
      movies: List<MovieModel>.from(
          map['results']?.map((x) => MovieModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesResultModel.fromJson(String source) {
    return MoviesResultModel.fromMap(json.decode(source));
  }
}
