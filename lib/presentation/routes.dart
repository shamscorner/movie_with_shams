import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/route_constants.dart';
import 'package:movie_with_shams/presentation/journeys/favorite_movies/favorite_movies_screen.dart';
import 'package:movie_with_shams/presentation/journeys/home/home_screen.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_details_arguments.dart';
import 'package:movie_with_shams/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_with_shams/presentation/journeys/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieDetailArguments: settings.arguments as MovieDetailArguments,
            ),
        RouteList.watchTrailer: (context) => WatchVideoScreen(
              watchVideoArguments: settings.arguments as WatchVideoArguments,
            ),
        RouteList.favoriteMovies: (context) => FavoriteMoviesScreen(),
      };
}
