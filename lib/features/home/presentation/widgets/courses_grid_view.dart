import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:e_learning_app/features/home/presentation/widgets/courses_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({
    super.key,
    required this.itemCount,
    required this.courses,
  });
  final int itemCount;
  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GridView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
            childAspectRatio: deviceWidth / (deviceHeight * 0.7),
          ),
          itemBuilder: (context, index) {
            
            final CourseModel course = courses[index];
            return CoursesCardDetails(
              title: course.title,
              price: course.price.toString(),
              imageUrl: course.image,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutePath.courseDetails,
                  arguments: course,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
