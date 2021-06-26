import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/presentation/blocs/video/video_bloc.dart';
import 'package:movie_with_shams/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideoBloc videoBloc;

  const VideosWidget({
    Key? key,
    required this.videoBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videoBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos != null) {
          final _videos = state.videos;
          if (_videos != null && _videos.iterator.moveNext()) {
            return Padding(
              padding: const EdgeInsets.only(
                left: Sizes.dimen_20,
                right: Sizes.dimen_20,
                top: Sizes.dimen_10,
                bottom: Sizes.dimen_20,
              ),
              child: Button(
                text: TranslationConstants.watchTrailers,
                onPressed: () {
                  print('hi');
                },
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
