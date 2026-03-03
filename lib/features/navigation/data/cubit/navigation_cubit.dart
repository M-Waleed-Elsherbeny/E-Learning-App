import 'package:e_learning_app/features/home/presentation/view/home_view.dart';
import 'package:e_learning_app/features/my_courses/presentation/view/my_courses_view.dart';
import 'package:e_learning_app/features/navigation/data/cubit/navigation_state.dart';
import 'package:e_learning_app/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationStateInitial());

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const MyCoursesView(),
    const ProfileView(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
