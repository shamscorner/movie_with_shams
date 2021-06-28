import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/domain/entities/movie_details_entity.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({
    Key? key,
    required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_20.w.toDouble(),
          ),
        ),
        BlocBuilder<FavoriteMovieBloc, FavoriteMovieState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () => BlocProvider.of<FavoriteMovieBloc>(context).add(
                  ToggleFavoriteMovieEvent(
                    MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                    state.isFavorite,
                  ),
                ),
                child: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_20.w.toDouble(),
                ),
              );
            }
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_20.w.toDouble(),
            );
          },
        ),
      ],
    );
  }
}
