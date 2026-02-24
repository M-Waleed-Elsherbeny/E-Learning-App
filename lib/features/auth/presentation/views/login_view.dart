import 'package:e_learning_app/core/assets/app_assets.dart';
import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: AppColors.kLightBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.svgMainLogo,
                  height: 150.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                CustomText(title: "Login", style: AppTextStyle.font24WhiteW600),
              ],
            ),
          ),
          heightSpace(40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: "Email", style: AppTextStyle.font14BlackW600),
                heightSpace(8),
                const CustomTextField(labelText: "Enter your email"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
