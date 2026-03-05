abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateError extends ProfileState {
  final String errMsg;
  ProfileStateError(this.errMsg);
}

class ProfileStateSuccess extends ProfileState {}

class GetUserNameLoadingState extends ProfileState {}

class GetUserNameErrorState extends ProfileState {
  final String errMsg;
  GetUserNameErrorState(this.errMsg);
}

class GetUserNameSuccessState extends ProfileState {
  final String userName, userEmail;
  GetUserNameSuccessState({required this.userName, required this.userEmail});
}
