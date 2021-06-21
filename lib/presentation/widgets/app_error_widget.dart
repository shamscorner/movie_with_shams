import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/domain/entities/app_error.dart';
import 'package:movie_with_shams/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: Sizes.dimen_10.h.toDouble(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w.toDouble(),
            ),
            children: [
              Button(
                onPressed: onPressed,
                text: TranslationConstants.retry,
              ),
              Button(
                onPressed: () => Wiredash.of(context)?.show(),
                text: TranslationConstants.feedback,
              ),
            ],
          )
        ],
      ),
    );
  }
}
