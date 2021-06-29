import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_with_shams/data/core/api_client.dart';
import 'package:movie_with_shams/data/data_sources/language_local_data_source.dart';
import 'package:movie_with_shams/data/data_sources/movie_local_data_source.dart';
import 'package:movie_with_shams/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_with_shams/data/repositories/app_repository_impl.dart';
import 'package:movie_with_shams/data/repositories/movie_repository_impl.dart';
import 'package:movie_with_shams/domain/repositories/app_repository.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/check_if_movie_is_favorite.dart';
import 'package:movie_with_shams/domain/usecases/delete_favotire_movie.dart';
import 'package:movie_with_shams/domain/usecases/get_cast.dart';
import 'package:movie_with_shams/domain/usecases/get_coming_soon.dart';
import 'package:movie_with_shams/domain/usecases/get_favorite_movies.dart';
import 'package:movie_with_shams/domain/usecases/get_movie_detail.dart';
import 'package:movie_with_shams/domain/usecases/get_playing_now.dart';
import 'package:movie_with_shams/domain/usecases/get_popular.dart';
import 'package:movie_with_shams/domain/usecases/get_preferred_language.dart';
import 'package:movie_with_shams/domain/usecases/get_searched_movies.dart';
import 'package:movie_with_shams/domain/usecases/get_trending.dart';
import 'package:movie_with_shams/domain/usecases/get_videos.dart';
import 'package:movie_with_shams/domain/usecases/save_favorite_movie.dart';
import 'package:movie_with_shams/domain/usecases/update_language.dart';
import 'package:movie_with_shams/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/language/language_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/video/video_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  // data sources
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  // api usecases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));
  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  getItInstance.registerLazySingleton<GetSearchedMovies>(
      () => GetSearchedMovies(getItInstance()));

  // database usecases
  getItInstance.registerLazySingleton<SaveFavoriteMovie>(
      () => SaveFavoriteMovie(getItInstance()));
  getItInstance.registerLazySingleton<GetFavotireMovies>(
      () => GetFavotireMovies(getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfMovieIsFavorite>(
      () => CheckIfMovieIsFavorite(getItInstance()));
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  // repositories
  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));
  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
            getItInstance(),
          ));

  // blocs
  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videoBloc: getItInstance(),
      favoriteMovieBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => VideoBloc(
      getVideos: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => SearchMovieBloc(
      getSearchedMovies: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => FavoriteMovieBloc(
      saveFavoriteMovie: getItInstance(),
      getFavotireMovies: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      checkIfMovieIsFavorite: getItInstance(),
    ),
  );
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));
}
