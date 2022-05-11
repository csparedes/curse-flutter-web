import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static navigateTo(String route) =>
      navigatorKey.currentState!.pushNamed(route);
  static replaceTo(String route) =>
      navigatorKey.currentState!.pushReplacementNamed(route);
}
