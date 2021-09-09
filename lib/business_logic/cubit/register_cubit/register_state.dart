part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMsg;

  RegisterErrorState(this.errorMsg);
}

class RegisterSuccessState extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccessState(this.registerModel);
}
