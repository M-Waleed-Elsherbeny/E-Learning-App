import 'package:e_learning_app/core/helper/custom_loading.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/features/my_courses/data/cubit/my_courses_cubit.dart';
import 'package:e_learning_app/features/my_courses/data/cubit/my_courses_state.dart';
import 'package:e_learning_app/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:e_learning_app/features/my_courses/presentation/widgets/my_courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyCoursesCubit>(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Courses", style: AppTextStyle.font24WhiteW600),
          centerTitle: true,
          backgroundColor: AppColors.kPrimaryColorBlue,
          leading: const SizedBox.shrink(),
        ),
        body: BlocConsumer<MyCoursesCubit, MyCoursesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is InitialMyCoursesState ||
                    state is GetMyCoursesLoading
                ? customLoading()
                : state is GetMyCoursesSuccess && state.courses.isNotEmpty
                ? ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      final courses = state.courses[index];
                      return MyCoursesCard(
                        imageUrl: courses.image,
                        courseTitle: courses.title,
                        instructorName: courses.price.toString(),
                      );
                    },
                  )
                : const Center(
                    child: CustomText(
                      title: "You Have not Enrolled in any courses",
                    ),
                  );
          },
        ),
      ),
    );
  }
}
