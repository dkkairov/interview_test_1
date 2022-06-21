import 'package:flutter/material.dart';
import 'package:interview_test_1/ui/navigation/main_navigation.dart';
import 'package:interview_test_1/ui/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIND TEST',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainBlack,
        ),
        scaffoldBackgroundColor: AppColors.mainLightGrey,
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
    );
  }
}