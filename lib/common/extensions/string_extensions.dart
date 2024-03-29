import 'package:flutter/cupertino.dart';
import 'package:movie_with_shams/presentation/app_localizations.dart';

extension StringExtension on String {
  String toIntelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
