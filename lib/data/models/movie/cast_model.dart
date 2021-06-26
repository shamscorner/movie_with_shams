import 'dart:convert';

import 'package:movie_with_shams/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  final bool? adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String character;
  final String creditId;
  final int? order;

  CastModel({
    this.adult,
    this.gender,
    required this.id,
    this.knownForDepartment,
    required this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    required this.creditId,
    this.order,
  }) : super(
          name: name,
          character: character,
          creditId: creditId,
        );

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      adult: map['adult'],
      gender: map['gender'],
      id: map['id'],
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
      castId: map['cast_id'],
      character: map['character'],
      creditId: map['credit_id'],
      order: map['order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CastModel(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
  }
}
