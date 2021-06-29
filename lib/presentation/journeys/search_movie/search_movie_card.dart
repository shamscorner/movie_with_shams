import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/route_constants.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/data/core/api_constants.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_details_arguments.dart';
import 'package:movie_with_shams/presentation/themes/app_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArguments(movie.id),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16,
          vertical: Sizes.dimen_8,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.dimen_8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Sizes.dimen_4.w.toDouble(),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  width: Sizes.dimen_80.w.toDouble(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
