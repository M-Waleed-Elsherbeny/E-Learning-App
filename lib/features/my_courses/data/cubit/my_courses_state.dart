import 'package:e_learning_app/features/home/data/models/course_model.dart';

abstract class MyCoursesState {}

class InitialMyCoursesState extends MyCoursesState {}

class GetMyCoursesLoading extends MyCoursesState {}

class GetMyCoursesSuccess extends MyCoursesState {
  final List<CourseModel> courses;
  GetMyCoursesSuccess({required this.courses});
}

class GetMyCoursesError extends MyCoursesState {
  final String errMsg;
  GetMyCoursesError(this.errMsg);
}
