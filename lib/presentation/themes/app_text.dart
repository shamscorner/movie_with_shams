import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';

class AppText {
  const AppText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5!.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_24.sp.toDouble(),
        color: Colors.white,
      );
  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp.toDouble(),
        color: Colors.white,
      );
  static TextStyle get _whiteButton => _poppinsTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_14.sp.toDouble(),
        color: Colors.white,
      );
  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
        fontSize: Sizes.dimen_14.sp.toDouble(),
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );
  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1!.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
  TextStyle get greySubtitle1 => subtitle1!.copyWith(
        color: Colors.grey,
      );
  TextStyle get violetHeadline6 => headline6!.copyWith(
        color: AppColor.violet,
      );
  TextStyle get vulcanBodyText2 => bodyText2!.copyWith(
        color: AppColor.vulcan,
        fontWeight: FontWeight.w600,
      );
  TextStyle get greyCaption => caption!.copyWith(
        color: Colors.grey,
      );
}
