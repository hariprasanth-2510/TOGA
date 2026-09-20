import 'package:go_router/go_router.dart';

import '../features/learning/presentation/screens/chapter_screen.dart';
import '../features/learning/presentation/screens/learn_screen.dart';
import '../features/learning/presentation/screens/unit_detail_screen.dart';
import '../features/learning/presentation/screens/unit_list_screen.dart';
import 'home_screen.dart';
import '../features/assessment/presentation/screens/assessment_config_screen.dart';
import '../features/assessment/presentation/screens/assessment_results_screen.dart';
import '../features/assessment/presentation/screens/assessment_screen.dart';
import '../features/assessment/presentation/screens/question_review_screen.dart';

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
                    subjectId: int.parse(state.pathParameters['subjectId']!),
                    chapterId: int.parse(state.pathParameters['chapterId']!),
                    unitId: int.parse(state.pathParameters['unitId']!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/assessment',
      builder: (context, state) => const AssessmentConfigScreen(),
      routes: [
        GoRoute(
          path: ':attemptId',
          builder: (context, state) => AssessmentScreen(
            attemptId: state.pathParameters['attemptId']!,
          ),
        ),
        // These are deliberately siblings of the editable attempt route.
        // Nesting them under `:attemptId` also built AssessmentScreen below
        // them; its submitted-attempt redirect then immediately replaced the
        // review page with results.
        GoRoute(
          path: ':attemptId/results',
          builder: (context, state) => AssessmentResultsScreen(
            attemptId: state.pathParameters['attemptId']!,
          ),
        ),
        GoRoute(
          path: ':attemptId/review',
          builder: (context, state) => QuestionReviewScreen(
            attemptId: state.pathParameters['attemptId']!,
          ),
        ),
      ],
    ),
  ],
);
