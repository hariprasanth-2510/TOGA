import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'theme.dart';
import 'theme_mode_provider.dart';

class TogaApp extends ConsumerWidget {
  TogaApp({super.key, GoRouter? router}) : router = router ?? appRouter;

  final GoRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'TOGA',
      debugShowCheckedModeBanner: false,
      theme: TogaTheme.light(),
      darkTheme: TogaTheme.dark(),
      themeMode: ref.watch(themeModeProvider),
      routerConfig: router,
    );
  }
}
