import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/data/core/api_constants.dart';
import 'package:movie_with_shams/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_with_shams/presentation/themes/app_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Container(
            padding: EdgeInsets.only(
              bottom: Sizes.dimen_20.h.toDouble(),
            ),
            height: Sizes.dimen_350.h.toDouble(),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final castEntity = state.casts[index];
                return Container(
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_8.w.toDouble(),
                      vertical: Sizes.dimen_4.h.toDouble(),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Sizes.dimen_8.w.toDouble(),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                Sizes.dimen_8.h.toDouble(),
                              ),
                            ),
                            child: CachedNetworkImage(
                              height: Sizes.dimen_150.h.toDouble(),
                              width: Sizes.dimen_150.w.toDouble(),
                              imageUrl:
                                  '${ApiConstants.BASE_IMAGE_URL}${castEntity.profilePath}',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Sizes.dimen_10, top: Sizes.dimen_4),
                          child: Text(
                            castEntity.name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.vulcanBodyText2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.dimen_10,
                            right: Sizes.dimen_10,
                            bottom: Sizes.dimen_10,
                          ),
                          child: Text(
                            castEntity.character,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
