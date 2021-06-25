import 'dart:convert';

import 'package:movie_with_shams/domain/entities/movie_details_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool? adult;
  final String backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final double? popularity;
  final String posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  final double voteAverage;
  final int? voteCount;

  MovieDetailModel({
    this.adult,
    required this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.popularity,
    required this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    required this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    required this.title,
    this.video,
    required this.voteAverage,
    this.voteCount,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          backdropPath: backdropPath,
          posterPath: posterPath,
        );

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection?.toMap(),
      'budget': budget,
      'genres': genres?.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies?.map((x) => x.toMap()).toList(),
      'production_countries':
          productionCountries?.map((x) => x.toMap()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages?.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      belongsToCollection: map['belongs_to_collection'] != null
          ? BelongsToCollection.fromMap(map['belongs_to_collection'])
          : null,
      budget: map['budget'],
      genres: List<Genres>.from(map['genres']?.map((x) => Genres.fromMap(x))),
      homepage: map['homepage'],
      id: map['id'],
      imdbId: map['imdb_id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      productionCompanies: List<ProductionCompanies>.from(
        map['production_companies']?.map(
          (x) => ProductionCompanies.fromMap(x),
        ),
      ),
      productionCountries: List<ProductionCountries>.from(
        map['production_countries']?.map(
          (x) => ProductionCountries.fromMap(x),
        ),
      ),
      releaseDate: map['release_date'],
      revenue: map['revenue'],
      runtime: map['runtime'],
      spokenLanguages: List<SpokenLanguages>.from(
        map['spoken_languages']?.map(
          (x) => SpokenLanguages.fromMap(x),
        ),
      ),
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id'],
      name: map['name'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source));
}

class Genres {
  int id;
  String name;

  Genres({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Genres.fromMap(Map<String, dynamic> map) {
    return Genres(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Genres.fromJson(String source) => Genres.fromMap(json.decode(source));
}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompanies.fromMap(Map<String, dynamic> map) {
    return ProductionCompanies(
      id: map['id'],
      logoPath: map['logo_path'],
      name: map['name'],
      originCountry: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanies.fromJson(String source) =>
      ProductionCompanies.fromMap(json.decode(source));
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({
    required this.iso31661,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  factory ProductionCountries.fromMap(Map<String, dynamic> map) {
    return ProductionCountries(
      iso31661: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountries.fromJson(String source) =>
      ProductionCountries.fromMap(json.decode(source));
}

class SpokenLanguages {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguages({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguages.fromMap(Map<String, dynamic> map) {
    return SpokenLanguages(
      englishName: map['english_name'],
      iso6391: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguages.fromJson(String source) =>
      SpokenLanguages.fromMap(json.decode(source));
}
