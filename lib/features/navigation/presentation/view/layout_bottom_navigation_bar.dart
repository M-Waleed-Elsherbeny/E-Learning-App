import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/features/navigation/data/cubit/navigation_cubit.dart';
import 'package:e_learning_app/features/navigation/data/cubit/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutBottomNavigationBar extends StatelessWidget {
  const LayoutBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int index = context.read<NavigationCubit>().currentIndex;
        List screens = context.read<NavigationCubit>().screens;
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.kPrimaryColorBlue,
              boxShadow: [
                const BoxShadow(
                  color: AppColors.kPrimaryColorBlue,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                context.read<NavigationCubit>().changeIndex(index);
              },
              currentIndex: index,
              backgroundColor: Colors.transparent,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              selectedItemColor: AppColors.kDarkBlue,
              unselectedItemColor: AppColors.kScaffoldBackgroundColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: index == 0
                      ? const Icon(Icons.home_filled)
                      : const Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: index == 1
                      ? const Icon(Icons.school)
                      : const Icon(Icons.school_outlined),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  icon: index == 2
                      ? const Icon(Icons.person_2_rounded)
                      : const Icon(Icons.person_2_outlined),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
