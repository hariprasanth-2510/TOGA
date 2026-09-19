import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'theme.dart';

class TogaApp extends StatelessWidget {
  TogaApp({
    super.key,
    GoRouter? router,
  }) : router = router ?? appRouter;

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TOGA',
      debugShowCheckedModeBanner: false,
      theme: TogaTheme.light(),
      darkTheme: TogaTheme.dark(),
      routerConfig: router,
    );
  }
}
