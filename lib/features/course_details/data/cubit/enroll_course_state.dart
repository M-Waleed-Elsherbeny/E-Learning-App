abstract class EnrollCourseState {}

class EnrollCourseInitial extends EnrollCourseState {}

class EnrollCourseLoadingState extends EnrollCourseState {}

class EnrollCourseSuccessState extends EnrollCourseState {}

class EnrollCourseErrorState extends EnrollCourseState {
  final String errorMessage;

  EnrollCourseErrorState(this.errorMessage);
}

class UserEnrolledState extends EnrollCourseState {}

class UserNotEnrolledState extends EnrollCourseState {}
