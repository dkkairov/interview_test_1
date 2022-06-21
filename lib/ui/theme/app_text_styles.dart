import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:interview_test_1/ui/theme/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle cardMainTextStyle = const TextStyle(
    fontSize: 18,
    color: AppColors.mainBlack,
    fontWeight: FontWeight.w500,
  );

  static TextStyle cardAdditionalTextStyle = const TextStyle(
    color: AppColors.mainGrey,
    fontSize: 16,
  );

  static TextStyle walletNameTextStyle = const TextStyle(
    color: AppColors.mainDeepGrey,
    fontSize: 18,
    fontWeight: FontWeight.w500
  );

  static TextStyle walletBalanceTextStyle = const TextStyle(
    color: AppColors.mainLightGrey,
    fontSize: 28
  );

  static TextStyle walletFilterTextStyle = const TextStyle(
      color: AppColors.mainWhite,
      fontSize: 18
  );


}