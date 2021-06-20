import 'package:flutter/material.dart';
import 'package:movie_with_shams/common/constants/size_constants.dart';
import 'package:movie_with_shams/common/extensions/size_extensions.dart';

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const NavigationSubListItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            )
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_40.w.toDouble(),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
