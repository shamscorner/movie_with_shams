import 'dart:convert';

class CrewModel {
  final bool? adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  CrewModel({
    this.adult,
    this.gender,
    required this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

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
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
  }

  factory CrewModel.fromMap(Map<String, dynamic> map) {
    return CrewModel(
      adult: map['adult'],
      gender: map['gender'],
      id: map['id'],
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
      creditId: map['credit_id'],
      department: map['department'],
      job: map['job'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CrewModel.fromJson(String source) =>
      CrewModel.fromMap(json.decode(source));
}
