import 'package:e_learning_app/features/home/data/models/course_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetCoursesLoadingState extends HomeState {}

class GetCoursesSuccessState extends HomeState {
  final List<CourseModel> courses;
  GetCoursesSuccessState({required this.courses});
}

class GetCoursesErrorState extends HomeState {
  final String errorMessage;
  GetCoursesErrorState({required this.errorMessage});
}
