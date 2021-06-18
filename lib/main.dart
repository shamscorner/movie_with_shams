import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_with_shams/data/core/api_client.dart';
import 'package:movie_with_shams/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_with_shams/data/repositories/movie_repository_impl.dart';
import 'package:movie_with_shams/domain/entities/movie_entity.dart';
import 'package:movie_with_shams/domain/entities/no_params.dart';
import 'package:movie_with_shams/domain/repositories/movie_repository.dart';
import 'package:movie_with_shams/domain/usecases/get_coming_soon.dart';
import 'package:movie_with_shams/domain/usecases/get_playing_now.dart';
import 'package:movie_with_shams/domain/usecases/get_popular.dart';
import 'package:movie_with_shams/domain/usecases/get_trending.dart';

import 'domain/entities/app_error.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);

  // get trending movies
  GetTrending getTrending = GetTrending(movieRepository);
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
  GetPopular getPopular = GetPopular(movieRepository);
  eitherResponse = await getPopular(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of popular movies');
    print(r);
  });

  // get playing now movies
  GetPlayingNow getPlayingNow = GetPlayingNow(movieRepository);
  eitherResponse = await getPlayingNow(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of playing now movies');
    print(r);
  });

  // get coming soon movies
  GetComingSoon getComingSoon = GetComingSoon(movieRepository);
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
