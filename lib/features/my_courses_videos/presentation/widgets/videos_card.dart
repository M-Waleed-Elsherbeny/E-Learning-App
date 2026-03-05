import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/features/my_courses_videos/data/model/course_videos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosCard extends StatelessWidget {
  const VideosCard({
    super.key,
    required this.title,
    required this.description,
    required this.videosModel,
  });
  final String title, description;
  final CourseVideosModel videosModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kScaffoldBackgroundColor,
      elevation: 4,
      shadowColor: AppColors.kLightBlue,
      child: ListTile(
        title: Text(title, style: AppTextStyle.font16BlackWBold),
        subtitle: Text(
          description,
          style: AppTextStyle.font16greyW400.copyWith(fontSize: 14.sp),
        ),
        trailing: Icon(
          Icons.play_circle_fill,
          color: AppColors.kPrimaryColorBlue,
          size: 40.r,
        ),
        leading: Icon(
          Icons.check_box_outline_blank,
          color: AppColors.kPrimaryColorBlue,
          size: 20.r,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutePath.videoPlayerView,
            arguments: videosModel,
          );
        },
      ),
    );
  }
}
