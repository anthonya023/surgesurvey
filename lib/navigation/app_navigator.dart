import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surgesurvey/navigation/route_path.dart';

class AppNavigator {
  static void goToHome(BuildContext context) {
    context.go(RoutePath.home);
  }

  static void goToSurvey(BuildContext context) {
    context.go(RoutePath.newSurvey);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static void push(BuildContext context, String route) {
    context.push(route);
  }
}
