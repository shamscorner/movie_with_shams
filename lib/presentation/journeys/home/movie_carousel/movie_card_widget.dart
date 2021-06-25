import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/data/core/api_constants.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_with_shams/presentation/journeys/movie_detail/movie_details_arguments.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movieId),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
