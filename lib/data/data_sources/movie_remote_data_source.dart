import 'package:movie_with_shams/data/core/api_client.dart';
import 'package:movie_with_shams/data/models/movie/cast_crew_result_model.dart';
import 'package:movie_with_shams/data/models/movie/cast_model.dart';
import 'package:movie_with_shams/data/models/movie/movie_detail_model.dart';
import 'package:movie_with_shams/data/models/movie/movie_model.dart';
import 'package:movie_with_shams/data/models/movie/movies_result_model.dart';
import 'package:movie_with_shams/data/models/movie/video_model.dart';
import 'package:movie_with_shams/data/models/movie/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCast(int id);
  Future<List<VideoModel>?> getVideos(int id);
  Future<List<MovieModel>?> getSearchedMovies(String searchTerm);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Trending movies: ');
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Popular movies: ');
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Upcoming movies: ');
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Playing now movies: ');
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print('Movie detail for id: $id');
    print(movie.toString());
    return movie;
  }

  @override
  Future<List<CastModel>> getCast(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print('Cast for movie id: $id');
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>?> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print('Videos for movie id: $id');
    print(videos);
    return videos;
  }

  @override
  Future<List<MovieModel>?> getSearchedMovies(String searchTerm) async {
    final response = await _client.get('search/movie', params: {
      'query': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(response).movies;
    print('Movies for searched term: $searchTerm');
    print(movies);
    return movies;
  }
}
