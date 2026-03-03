import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/features/my_courses/presentation/widgets/my_courses_card.dart';
import 'package:flutter/material.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Courses", style: AppTextStyle.font24WhiteW600),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColorBlue,
        leading: const SizedBox.shrink(),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const MyCoursesCard(
            imageUrl:
                'https://technobrains.io/wp-content/uploads/2021/07/flutter-Featured-Blog-Image2.jpg',
            courseTitle: "courseTitle",
            instructorName: "instructorName",
          );
        },
      ),
    );
  }
}
