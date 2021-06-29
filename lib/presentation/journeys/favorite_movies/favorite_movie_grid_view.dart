import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/presentation/journeys/favorite_movies/favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: Sizes.dimen_10.w.toDouble(),
          mainAxisSpacing: Sizes.dimen_10.w.toDouble(),
        ),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
