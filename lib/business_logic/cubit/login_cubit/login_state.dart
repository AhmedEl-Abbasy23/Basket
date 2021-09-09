part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginChangePasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;

  LoginErrorState(this.errorMsg);
}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
