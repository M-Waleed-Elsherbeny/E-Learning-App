import 'package:e_learning_app/features/my_courses_videos/data/cubit/course_videos_state.dart';
import 'package:e_learning_app/features/my_courses_videos/data/repo/course_videos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseVideosCubit extends Cubit<CourseVideosState> {
  final CourseVideosRepo courseVideosRepo;
  CourseVideosCubit(this.courseVideosRepo) : super(CourseVideosInitial());

  Future<void> getCourseVideos(String courseId) async {
    emit(CourseVideosLoading());
    final result = await courseVideosRepo.getCourseVideos(courseId);
    result.fold(
      (error) => emit(CourseVideosFailure(error)),
      (videos) => emit(CourseVideosSuccess(videos)),
    );
  }
}