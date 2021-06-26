import 'dart:convert';

import 'package:movie_with_shams/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  final String? id;
  final String? iso6391;
  final String? iso31661;
  final String key;
  final String name;
  final String? site;
  final int? size;
  final String type;

  VideoModel({
    this.id,
    this.iso6391,
    this.iso31661,
    required this.key,
    required this.name,
    this.site,
    this.size,
    required this.type,
  }) : super(
          key: key,
          title: name,
          type: type,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'key': key,
      'name': name,
      'site': site,
      'size': size,
      'type': type,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      iso6391: map['iso_639_1'],
      iso31661: map['iso_3166_1'],
      key: map['key'],
      name: map['name'],
      site: map['site'],
      size: map['size'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoModel(id: $id, iso6391: $iso6391, iso31661: $iso31661, key: $key, name: $name, site: $site, size: $size, type: $type)';
  }
}
