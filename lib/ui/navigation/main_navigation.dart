import 'package:flutter/material.dart';
import 'package:interview_test_1/ui/widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.mainScreen;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (context) => const MainScreen(),
  };

  MainNavigation();
}