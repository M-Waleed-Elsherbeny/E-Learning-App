import 'package:e_learning_app/core/assets/app_assets.dart';
import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.kSecondaryColorGrey,
                thickness: 1,
              ),
            ),
            CustomText(
              title: "  or continue with  ",
              style: AppTextStyle.font16greyW400.copyWith(fontSize: 14.sp),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.kSecondaryColorGrey,
                thickness: 1,
              ),
            ),
          ],
        ),
        heightSpace(32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                color: AppColors.kLightBlue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgGoogle),
            ),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                color: AppColors.kLightBlue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgFacebook),
            ),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                color: AppColors.kLightBlue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgApple),
            ),
          ],
        ),
      ],
    );
  }
}
