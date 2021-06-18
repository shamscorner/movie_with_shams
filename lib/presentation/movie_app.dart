import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/screenutil/screen_util.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';
import 'package:movie_with_shams/presentation/themes/app_text.dart';

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
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: AppText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      // home: HomeScreen(),
    );
  }
}
