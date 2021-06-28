import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/di/get_it.dart';
import 'package:movie_with_shams/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_with_shams/presentation/blocs/video/video_bloc.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/big_poster.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_details_arguments.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/videos_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideoBloc _videoBloc;
  late FavoriteMovieBloc _favoriteMovieBloc;

  @override
  void initState() {
    super.initState();

    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videoBloc = _movieDetailBloc.videoBloc;
    _favoriteMovieBloc = _movieDetailBloc.favoriteMovieBloc;

    _movieDetailBloc.add(
      MovieDetailLoadEvent(widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _videoBloc.close();
    _favoriteMovieBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videoBloc),
          BlocProvider.value(value: _favoriteMovieBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w.toDouble(),
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w.toDouble(),
                        vertical: Sizes.dimen_16.h.toDouble(),
                      ),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videoBloc: _videoBloc),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
