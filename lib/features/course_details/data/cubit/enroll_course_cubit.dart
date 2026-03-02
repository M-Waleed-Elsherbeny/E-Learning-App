import 'package:e_learning_app/features/course_details/data/cubit/enroll_course_state.dart';
import 'package:e_learning_app/features/course_details/data/repo/course_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnrollCourseCubit extends Cubit<EnrollCourseState> {
  final CourseDetailsRepo courseRepo;
  EnrollCourseCubit(this.courseRepo) : super(EnrollCourseInitial());

  Future<void> enrollInCourse(courseId, userId) async {
    emit(EnrollCourseLoadingState());
    final result = await courseRepo.enrollInCourse(courseId, userId);
    result.fold(
      (error) => emit(EnrollCourseErrorState(error)),
      (_) => emit(EnrollCourseSuccessState()),
    );
  }

  Future<void> checkEnrollment({required courseId, required userId}) async {
    emit(EnrollCourseLoadingState());
    final result = await courseRepo.checkEnrollment(
      courseId: courseId,
      userId: userId,
    );
    result.fold((error) => emit(EnrollCourseErrorState(error)), (isEnrolled) {
      if (isEnrolled) {
        emit(UserEnrolledState());
      } else {
        emit(UserNotEnrolledState());
      }
    });
  }
}
