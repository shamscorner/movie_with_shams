import 'package:movie_with_shams/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>?> getTrending();
}
