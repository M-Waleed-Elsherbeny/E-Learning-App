import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            decoration: const BoxDecoration(color: AppColors.kPrimaryColorBlue),
          ),
        ],
      ),
    );
  }
}
