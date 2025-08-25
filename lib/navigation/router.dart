import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surgesurvey/navigation/route_path.dart';
import 'package:surgesurvey/presentation/screen/home/home_screen.dart';
import 'package:surgesurvey/presentation/screen/new_survey/new_survey_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: RoutePath.newSurvey,
          builder: (BuildContext context, GoRouterState state) {
            return const NewSurveyScreen();
          },
        ),
      ],
    ),
  ],
);
