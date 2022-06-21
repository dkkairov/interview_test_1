import 'package:flutter/material.dart';
import 'package:interview_test_1/ui/theme/app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle mainOutlinedButton = OutlinedButton.styleFrom(
    primary: AppColors.mainWhite,
    padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 7
    ),
    textStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.mainWhite
    ),
    side: const BorderSide(
        width: 0.7,
        color: AppColors.mainDeepGrey,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static final BoxDecoration mainBoxDecoration = BoxDecoration (
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: AppColors.mainDeepGrey),
    color: Colors.transparent,
  );
}