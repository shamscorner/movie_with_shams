import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/languages.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';
import 'package:movie_with_shams/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_with_shams/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_with_shams/presentation/widgets/logo.dart';

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
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListTile(
              title: 'Language',
              onPressed: () {},
              children: Languages.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
