import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesCard extends StatelessWidget {
  const MyCoursesCard({
    super.key,
    required this.imageUrl,
    required this.courseTitle,
    required this.instructorName,
    required this.courseModel,
  });
  final String imageUrl, courseTitle, instructorName;
  final CourseModel courseModel;

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
        padding: EdgeInsets.only(right: 10.w),
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: AppColors.kScaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: 120.w,
              height: double.infinity,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            widthSpace(15),
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
                    Navigator.pushNamed(
                      context,
                      AppRoutePath.myCoursesVideos,
                      arguments: courseModel,
                    );
                  },
                  text: "View Course",
                  style: AppTextStyle.font12WhiteBold,
                  width: 70.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
