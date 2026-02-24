import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String errorMessage,
    {Color backgroundColor = AppColors.kErrorColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorMessage), backgroundColor: backgroundColor),
  );
}
