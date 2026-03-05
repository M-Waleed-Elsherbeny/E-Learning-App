import 'package:e_learning_app/features/my_courses_videos/data/model/course_videos_model.dart';

abstract class CourseVideosState {}

class CourseVideosInitial extends CourseVideosState {}
class CourseVideosLoading extends CourseVideosState {}
class CourseVideosSuccess extends CourseVideosState {
  final List<CourseVideosModel> videos;

  CourseVideosSuccess(this.videos);
}

class CourseVideosFailure extends CourseVideosState {
  final String errorMsg;

  CourseVideosFailure(this.errorMsg);
}