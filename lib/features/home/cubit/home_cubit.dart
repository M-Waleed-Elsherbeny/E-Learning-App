import 'package:e_learning_app/features/home/cubit/home_state.dart';
import 'package:e_learning_app/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitialState());

  Future<void> fetchCourses() async {
    try {
      await getUserName();
      emit(GetCoursesLoadingState());
      final res = await homeRepo.getCourses();
      res.fold(
        (err) {
          emit(GetCoursesErrorState(errorMessage: err));
        },
        (courses) {
          emit(GetCoursesSuccessState(courses: courses));
        },
      );
    } catch (e) {
      emit(GetCoursesErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getUserName() async {
    try {
      emit(GetUserNameLoadingState());
      final res = await homeRepo.getUserName();
      res.fold(
        (err) {
          emit(GetUserNameErrorState(errorMessage: err));
        },
        (name) {
          emit(GetUserNameSuccessState(userName: name));
        },
      );
    } catch (e) {
      emit(GetUserNameErrorState(errorMessage: e.toString()));
    }
  }
}
