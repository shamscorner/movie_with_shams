import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/di/get_it.dart';
import 'package:movie_with_shams/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:movie_with_shams/presentation/journeys/favorite_movies/favorite_movie_grid_view.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  late FavoriteMovieBloc _favoriteMovieBloc;

  @override
  void initState() {
    super.initState();

    _favoriteMovieBloc = getItInstance<FavoriteMovieBloc>();
    _favoriteMovieBloc.add(LoadFavoriteMovieEvent());
  }

  @override
  void dispose() {
    _favoriteMovieBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.favoriteMovies.t(context),
        ),
      ),
      body: BlocProvider.value(
        value: _favoriteMovieBloc,
        child: BlocBuilder<FavoriteMovieBloc, FavoriteMovieState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovie.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
