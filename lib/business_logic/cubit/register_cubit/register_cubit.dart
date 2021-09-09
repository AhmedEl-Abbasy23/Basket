import 'package:basket/data/models/register_model.dart';
import 'package:basket/data/web_services/dio_web_services.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isObscure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  RegisterModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) {
    emit(RegisterLoadingState());
    WebServices.postData(
      url: register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phoneNumber
      },
    ).then(
      (value) {
        registerModel = RegisterModel.fromJson(value.data);
        emit(RegisterSuccessState(registerModel!));
      },
    ).catchError(
      (error) {
        emit(RegisterErrorState(error.toString()));
      },
    );
  }
}
