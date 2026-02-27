import 'package:e_learning_app/core/assets/app_assets.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: const BoxDecoration(color: AppColors.kLightBlue),
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.svgMainLogo,
            height: 150.h,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          CustomText(title: title, style: AppTextStyle.font24WhiteW600),
        ],
      ),
    );
  }
}
