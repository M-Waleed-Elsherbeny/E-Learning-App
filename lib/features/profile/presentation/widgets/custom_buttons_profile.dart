import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonsProfile extends StatelessWidget {
  const CustomButtonsProfile({super.key, required this.userName, required this.userEmail});
  final String userName, userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.r,
            color: AppColors.kPrimaryColorBlue,
            offset: const Offset(4, 4),
          ),
          BoxShadow(
            blurRadius: 5.r,
            color: AppColors.kErrorColor,
            offset: const Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText(title: "Name:"),
          CustomText(title: userName),
          Divider(color: AppColors.kDarkBlue),
          CustomText(title: "Email:"),
          CustomText(title: userEmail),
        ],
      ),
    );
  }
}
