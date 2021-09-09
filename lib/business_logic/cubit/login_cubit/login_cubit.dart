import 'package:basket/data/models/login_model.dart';
import 'package:basket/data/web_services/dio_web_services.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isObscure = true;

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    WebServices.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        print(value.data.runtimeType);
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel!));
      },
    ).catchError(
      (error) {
        emit(LoginErrorState(error.toString()));
        print(error.toString());
      },
    );

    print(email + password);
  }
}
