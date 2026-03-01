import 'package:e_learning_app/core/helper/custom_loading.dart';
import 'package:e_learning_app/core/helper/custom_snack_bar.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/features/home/cubit/home_cubit.dart';
import 'package:e_learning_app/features/home/cubit/home_state.dart';
import 'package:e_learning_app/features/home/data/repo/home_repo.dart';
import 'package:e_learning_app/features/home/presentation/widgets/courses_grid_view.dart';
import 'package:e_learning_app/features/home/presentation/widgets/top_header_with_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeRepo())..fetchCourses(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetCoursesErrorState) {
            customSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().fetchCourses(),
              backgroundColor: Colors.transparent,
              color: Colors.transparent,
              elevation: 0.0,
              child: Column(
                children: [
                  const TopHeaderWithSearch(userName: "Mohammed Waleed"),
                  state is GetCoursesLoadingState
                      ? customLoading()
                      : state is GetCoursesSuccessState &&
                            state.courses.isNotEmpty
                      ? CoursesGridView(
                          itemCount: state.courses.length,
                          courses: state.courses,
                        )
                      : Expanded(
                          child: Center(
                            child: CustomText(
                              title: "No courses available",
                              style: AppTextStyle.font16BlackWBold,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
