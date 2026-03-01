import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesCardDetails extends StatelessWidget {
  const CoursesCardDetails({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl, this.onPressed,
  });
  final String title, price, imageUrl;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kScaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          const BoxShadow(
            color: AppColors.kPrimaryColorBlue,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: Image.network(
              imageUrl,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          heightSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: title, style: AppTextStyle.font16BlackWBold),
                heightSpace(10),
                CustomText(
                  title: "$price EGP",
                  style: AppTextStyle.font16greyW400.copyWith(fontSize: 14.sp),
                ),
                heightSpace(10),
                MyCustomButton(
                  text: "Show Details",
                  onPressed: onPressed,
                  height: 40.h,
                  style: AppTextStyle.font12WhiteBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
