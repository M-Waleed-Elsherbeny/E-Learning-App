import 'package:e_learning_app/features/profile/data/cubit/profile_state.dart';
import 'package:e_learning_app/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(InitialProfileState());

  Future<void> signOut() async {
    try {
      emit(ProfileStateLoading());
      final res = await profileRepo.signOut();
      res.fold(
        (err) {
          emit(ProfileStateError(err));
        },
        (_) {
          emit(ProfileStateSuccess());
        },
      );
    } catch (e) {
      emit(ProfileStateError(e.toString()));
    }
  }

  Future<void> getUserName() async {
    try {
      emit(GetUserNameLoadingState());
      final res = await profileRepo.getUserName();
      res.fold(
        (err) {
          emit(GetUserNameErrorState(err));
        },
        (user) {
          emit(
            GetUserNameSuccessState(
              userName: user["name"],
              userEmail: user["email"],
            ),
          );
        },
      );
    } catch (e) {
      emit(GetUserNameErrorState(e.toString()));
    }
  }
}
