import 'package:go_router/go_router.dart';
import 'package:score_calculator/src/core/presentation/screens/results_screen.dart';
import 'package:score_calculator/src/core/presentation/screens/score_calculator_screen.dart';
import 'package:score_calculator/src/routing/routes_strings.dart';

final router = GoRouter(initialLocation: RoutesStrings.home, routes: [
  GoRoute(
    name: RoutesStrings.home,
    path: RoutesStrings.home,
    builder: (_, __) => const ScoreCalculatorScreen(),
    routes: [
      GoRoute(
        path: RoutesStrings.results,
        builder: (_, __) => const ResultsScreen(),
      ),
    ],
  )
]);
