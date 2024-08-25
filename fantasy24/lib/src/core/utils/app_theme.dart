import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 26.0.sp,
      color: AppColors.appBlack,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24.0.sp,
      color: AppColors.appBlack,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22.0.sp,
      color: AppColors.appBlack,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.0.sp,
      color: AppColors.appBlack,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.0.sp,
      color: AppColors.appBlack,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.0.sp,
      color: AppColors.appBlack,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.0.sp,
      color: AppColors.appBlack,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10.0.sp,
      color: AppColors.appBlack,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 8.0.sp,
      color: AppColors.appBlack,
    ),
  );
}
