import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/data/core/api_constants.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_details_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movie.id),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          Sizes.dimen_8.w.toDouble(),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<FavoriteMovieBloc>(context).add(
                    DeleteFavoriteMovieEvent(movie.id),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.dimen_12),
                  child: Icon(
                    Icons.delete,
                    size: Sizes.dimen_32.h.toDouble(),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
