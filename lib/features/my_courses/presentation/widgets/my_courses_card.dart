import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesCard extends StatelessWidget {
  const MyCoursesCard({super.key, required this.imageUrl, required this.courseTitle, required this.instructorName});
  final String imageUrl, courseTitle, instructorName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColors.kScaffoldBackgroundColor,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: AppColors.kScaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 150.w,
              height: double.infinity,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            widthSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: courseTitle,
                  style: AppTextStyle.font14BlackW600,
                ),
                heightSpace(10),
                CustomText(
                  title: instructorName,
                  style: AppTextStyle.font14BlackW600,
                ),
                heightSpace(20),
                MyCustomButton(
                  onPressed: () {
                    // Navigate to course details
                  },
                  text: "Complete Course",
                  style: AppTextStyle.font12WhiteBold,
                  width: 80.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
