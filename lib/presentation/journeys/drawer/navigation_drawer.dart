import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_with_shams/common/constants/languages.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/constants/translation_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/common/extensions/string_extensions.dart';
import 'package:movie_with_shams/presentation/blocs/language/language_bloc.dart';
import 'package:movie_with_shams/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movie_with_shams/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_with_shams/presentation/themes/app_color.dart';
import 'package:movie_with_shams/presentation/widgets/app_dialog.dart';
import 'package:movie_with_shams/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          )
        ],
      ),
      width: Sizes.dimen_250.w.toDouble(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_12.h.toDouble(),
                bottom: Sizes.dimen_32.h.toDouble(),
                left: Sizes.dimen_12.h.toDouble(),
                right: Sizes.dimen_12.h.toDouble(),
              ),
              child: Logo(
                height: Sizes.dimen_48.h.toDouble(),
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(
                    Languages.languages[index],
                  ),
                );
              },
              children: Languages.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context)?.show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.okay,
        image: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_80.h.toDouble(),
        ),
      ),
    );
  }
}
