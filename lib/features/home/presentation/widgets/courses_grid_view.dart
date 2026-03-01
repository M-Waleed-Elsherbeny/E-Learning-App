import 'package:e_learning_app/features/home/data/models/course_model.dart';
import 'package:e_learning_app/features/home/presentation/widgets/courses_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({super.key, required this.itemCount, required this.courses});
  final int itemCount;
  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GridView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final CourseModel course = courses[index];
            return CoursesCardDetails(
              title: course.title,
              price: course.price.toString(),
              imageUrl: course.image,
              // "https://prod-provider-images.s3.amazonaws.com/program_images/6AHrw3LAU7/flutter.png",
            );
          },
        ),
      ),
    );
  }
}