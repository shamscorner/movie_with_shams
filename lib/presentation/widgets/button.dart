import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            Sizes.dimen_20.w.toDouble(),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w.toDouble(),
      ),
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h.toDouble(),
      ),
      height: Sizes.dimen_48.h.toDouble(),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
