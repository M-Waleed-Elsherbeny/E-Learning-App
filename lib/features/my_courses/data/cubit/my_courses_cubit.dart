import 'package:e_learning_app/features/my_courses/data/cubit/my_courses_state.dart';
import 'package:e_learning_app/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;
  MyCoursesCubit(this.myCoursesRepo) : super(InitialMyCoursesState());

  Future<void> getMyCourses() async {
    try {
      final res = await myCoursesRepo.getMyCourses();
      res.fold(
        (error) {
          emit(GetMyCoursesError(error.toString()));
        },
        (courses) {
          emit(GetMyCoursesSuccess(courses: courses));
        },
      );
    } catch (e) {
      emit(GetMyCoursesError(e.toString()));
    }
  }
}
