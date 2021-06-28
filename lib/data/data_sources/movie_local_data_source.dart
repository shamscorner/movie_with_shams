import 'package:hive/hive.dart';
import 'package:movie_with_shams/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavorite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    bool isThere = movieBox.containsKey(movieId);

    if (isThere) {
      print('$movieId movie is there');
    } else {
      print('$movieId movie is not there');
    }

    return isThere;
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.delete(movieId);

    print('Deleted: $movieId');
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;

    List<MovieTable> movies = [];
    movieIds.forEach((movieId) {
      movies.add(movieBox.get(movieId));
    });

    print('Favorite movies: ');
    print(movies);

    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);

    print('Saved: ${movieTable.id}');
  }
}
