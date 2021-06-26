import 'dart:convert';

import 'package:movie_with_shams/data/models/movie/video_model.dart';

class VideoResultModel {
  int id;
  List<VideoModel>? videos;

  VideoResultModel({
    required this.id,
    this.videos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'results': videos?.map((x) => x.toMap()).toList(),
    };
  }

  factory VideoResultModel.fromMap(Map<String, dynamic> map) {
    return VideoResultModel(
      id: map['id'],
      videos: map['results'] != null
          ? List<VideoModel>.from(
              map['results'].map(
                (x) => VideoModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoResultModel.fromJson(String source) =>
      VideoResultModel.fromMap(json.decode(source));
}
