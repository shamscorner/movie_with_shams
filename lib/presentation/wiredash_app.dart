import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;

  const WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'demo_movie_app-8yeqokb',
      secret: 'lc8wt2jxvt9499xj4y41ba9vdtp9kbfvionezaln3mu9dcm2',
      navigatorKey: navigatorKey,
      child: child,
    );
  }
}
