import 'package:e_learning_app/core/helper/custom_loading.dart';
import 'package:e_learning_app/core/helper/custom_snack_bar.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_back_button.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:e_learning_app/features/my_courses_videos/data/cubit/course_videos_cubit.dart';
import 'package:e_learning_app/features/my_courses_videos/data/cubit/course_videos_state.dart';
import 'package:e_learning_app/features/my_courses_videos/presentation/widgets/videos_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesVideos extends StatelessWidget {
  const MyCoursesVideos({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos ${courseModel.title}",
          style: AppTextStyle.font24WhiteW600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColorBlue,
        leading: Navigator.canPop(context)
            ? const CustomBackButton()
            : const SizedBox.shrink(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: BlocConsumer<CourseVideosCubit, CourseVideosState>(
          listener: (context, state) {
            if (state is CourseVideosFailure) {
              customSnackBar(context, state.errorMsg);
            }
          },
          builder: (context, state) {
            return state is CourseVideosLoading
                ? customLoading()
                : state is CourseVideosSuccess && state.videos.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return VideosCard(
                        title: state.videos[index].title,
                        description: state.videos[index].desc,
                      );
                    },
                    itemCount: state.videos.length,
                  )
                : Center(
                    child: Text(
                      "No videos found",
                      style: AppTextStyle.font16BlackWBold,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
