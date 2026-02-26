abstract class AuthState {}

class AuthInitialState extends AuthState {}

// Login States
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

// Sign Up States
class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String errorMessage;

  SignUpErrorState(this.errorMessage);
}
