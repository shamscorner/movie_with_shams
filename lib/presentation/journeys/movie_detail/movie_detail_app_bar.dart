import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

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
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_20.w.toDouble(),
        ),
      ],
    );
  }
}
