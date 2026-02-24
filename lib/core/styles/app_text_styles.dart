import 'package:e_learning_app/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle textPrimary30Bold = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle textPrimaryUnderline12W500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.kPrimaryColor,
  );
  static const TextStyle textPrimary16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle textPrimary14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle textBlack16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle textGray14W500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.kGrayColor,
  );
  static const TextStyle textWhite20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor,
  );
}
