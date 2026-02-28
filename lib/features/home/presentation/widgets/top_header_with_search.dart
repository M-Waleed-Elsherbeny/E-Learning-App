import 'package:flutter/material.dart';
import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeaderWithSearch extends StatelessWidget {
  const TopHeaderWithSearch({super.key, this.userName = "User"});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColorBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace(10),
            CustomText(
              title: "Hello, $userName",
              style: AppTextStyle.font18White600,
            ),
            heightSpace(10),
            CustomText(
              title: "Welcome To Learn New Academy",
              style: AppTextStyle.font16WhiteNormal,
            ),
            heightSpace(20),
            SearchBar(
              hintText: "Search for Courses",
              leading: const Icon(
                Icons.search,
                color: AppColors.kPrimaryColorBlue,
              ),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                AppColors.kScaffoldBackgroundColor,
              ),
              surfaceTintColor: const WidgetStatePropertyAll(
                AppColors.kScaffoldBackgroundColor,
              ),
              // shape: WidgetStatePropertyAll(
              //   RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(30.r),
              //   ),
              // ),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
          ],
        ),
      ),
    );
  }
}
