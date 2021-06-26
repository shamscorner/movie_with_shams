import 'dart:convert';

import 'package:movie_with_shams/data/models/movie/cast_model.dart';
import 'package:movie_with_shams/data/models/movie/crew_model.dart';

class CastCrewResultModel {
  int id;
  List<CastModel> cast;
  List<CrewModel> crew;

  CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cast': cast.map((x) => x.toMap()).toList(),
      'crew': crew.map((x) => x.toMap()).toList(),
    };
  }

  factory CastCrewResultModel.fromMap(Map<String, dynamic> map) {
    return CastCrewResultModel(
      id: map['id'],
      cast: List<CastModel>.from(map['cast']?.map((x) => CastModel.fromMap(x))),
      crew: List<CrewModel>.from(map['crew']?.map((x) => CrewModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CastCrewResultModel.fromJson(String source) =>
      CastCrewResultModel.fromMap(json.decode(source));
}
