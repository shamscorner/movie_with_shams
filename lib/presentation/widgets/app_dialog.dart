import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';
import 'package:movie_with_shams/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Widget? image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_40,
      insetPadding: EdgeInsets.all(
        Sizes.dimen_32.w.toDouble(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Sizes.dimen_8.w.toDouble(),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_16.h.toDouble(),
          bottom: Sizes.dimen_16.h.toDouble(),
          left: Sizes.dimen_16.h.toDouble(),
          right: Sizes.dimen_16.h.toDouble(),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.dimen_16,
              ),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.dimen_24.h.toDouble(),
              ),
              child: image!,
            ),
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: TranslationConstants.okay,
            ),
          ],
        ),
      ),
    );
  }
}
