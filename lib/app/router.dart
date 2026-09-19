import 'package:go_router/go_router.dart';

import '../features/learning/presentation/screens/chapter_screen.dart';
import '../features/learning/presentation/screens/learn_screen.dart';
import '../features/learning/presentation/screens/unit_detail_screen.dart';
import '../features/learning/presentation/screens/unit_list_screen.dart';
import 'home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/learn',
      builder: (context, state) => const LearnScreen(),
      routes: [
        GoRoute(
          path: 'subject/:subjectId',
          builder: (context, state) => ChapterScreen(
            subjectId: int.parse(state.pathParameters['subjectId']!),
          ),
          routes: [
            GoRoute(
              path: 'chapter/:chapterId',
              builder: (context, state) => UnitListScreen(
                subjectId: int.parse(state.pathParameters['subjectId']!),
                chapterId: int.parse(state.pathParameters['chapterId']!),
              ),
              routes: [
                GoRoute(
                  path: 'unit/:unitId',
                  builder: (context, state) => UnitDetailScreen(
                    unitId: int.parse(state.pathParameters['unitId']!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
