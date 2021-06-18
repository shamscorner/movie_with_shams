import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/no_params.dart';
import 'package:movie_with_shams/domain/usecases/get_coming_soon.dart';
import 'package:movie_with_shams/domain/usecases/get_playing_now.dart';
import 'package:movie_with_shams/domain/usecases/get_popular.dart';
import 'package:movie_with_shams/domain/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

import 'domain/entities/app_error.dart';

void main() async {
  unawaited(getIt.init());

  // get trending movies
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of trending movies: ');
    print(r);
  });

  // get popular movies
  GetPopular getPopular = getIt.getItInstance<GetPopular>();
  eitherResponse = await getPopular(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of popular movies');
    print(r);
  });

  // get playing now movies
  GetPlayingNow getPlayingNow = getIt.getItInstance<GetPlayingNow>();
  eitherResponse = await getPlayingNow(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of playing now movies');
    print(r);
  });

  // get coming soon movies
  GetComingSoon getComingSoon = getIt.getItInstance<GetComingSoon>();
  eitherResponse = await getComingSoon(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of coming soon movies');
    print(r);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
