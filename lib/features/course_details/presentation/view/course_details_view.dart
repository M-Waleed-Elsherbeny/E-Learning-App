import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_back_button.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColorBlue,
        title: CustomText(
          title: courseModel.title,
          style: AppTextStyle.font18White600,
        ),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: NetworkImage(courseModel.image),
                    fit: BoxFit.fill,
                    alignment: AlignmentGeometry.center,
                  ),
                ),
              ),
              heightSpace(20),
              CustomText(title: courseModel.title),
              heightSpace(15),
              CustomText(
                title: "${courseModel.price.toStringAsFixed(0)} EGP",
                style: AppTextStyle.font14BlueWBold.copyWith(fontSize: 16.sp),
              ),
              heightSpace(20),
              const CustomText(title: "Description"),
              heightSpace(20),
              CustomText(
                title: courseModel.desc,
                style: AppTextStyle.font14BlackW600.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 100,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.r,
              color: AppColors.kLightBlue,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        margin: EdgeInsets.all(10.w),
        child: MyCustomButton(text: "Enroll Course", onPressed: () {}),
      ),
    );
  }
}
