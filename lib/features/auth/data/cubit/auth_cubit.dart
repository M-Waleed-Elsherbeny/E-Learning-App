import 'package:e_learning_app/features/auth/data/cubit/auth_state.dart';
import 'package:e_learning_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  AuthRepo authRepo = AuthRepo();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final res = await authRepo.signIn(email: email, password: password);
    res.fold(
      (failure) => emit(LoginErrorState(failure)),
      (_) => emit(LoginSuccessState()),
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final res = await authRepo.signUp(email: email, password: password);
    res.fold(
      (failure) => emit(SignUpErrorState(failure)),
      (_) => emit(SignUpSuccessState()),
    );
  }
}