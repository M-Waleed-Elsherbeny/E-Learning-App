import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kScaffoldBackgroundColor,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20.sp,
          color: AppColors.kPrimaryColorBlue,
        ),
      ),
    );
  }
}
