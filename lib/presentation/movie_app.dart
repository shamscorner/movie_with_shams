import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/languages.dart';
import 'package:movie_with_shams/common/screenutil/screen_util.dart';
import 'package:movie_with_shams/presentation/app_localizations.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';
import 'package:movie_with_shams/presentation/themes/app_text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie with Shams',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        accentColor: AppColor.royalBlue,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: AppText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      locale: Locale(Languages.languages[0].code),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}
