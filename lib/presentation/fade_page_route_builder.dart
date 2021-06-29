import 'package:flutter/cupertino.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder? builder;
  final RouteSettings settings;

  FadePageRouteBuilder({
    this.builder,
    required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder!(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(
              CurveTween(curve: Curves.ease),
            );

            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(microseconds: 500),
          settings: settings,
        );
}
