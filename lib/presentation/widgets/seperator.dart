import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';

class Seperator extends StatelessWidget {
  const Seperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_2.h.toDouble(),
      width: Sizes.dimen_80.w.toDouble(),
      margin: EdgeInsets.only(
        top: Sizes.dimen_2.h.toDouble(),
      ),
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h.toDouble(),
        bottom: Sizes.dimen_6.h.toDouble(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_1.h.toDouble()),
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}
