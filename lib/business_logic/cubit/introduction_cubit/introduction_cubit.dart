import 'package:basket/shared/constants/strings.dart';
import 'package:basket/shared/helpers/cache_helper.dart';
import 'package:basket/shared/styles/styles.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

part 'introduction_state.dart';

class IntroductionCubit extends Cubit<IntroductionState> {
  IntroductionCubit() : super(IntroductionInitialState());

  static IntroductionCubit get(context) => BlocProvider.of(context);

  void submit(context) {
    CacheHelper.saveData(key: 'introduction', value: true).then(
      (value) {
        if (value) {
          Navigator.pushReplacementNamed(context, loginScreen);
        }
      },
    );
  }

  var screens = [
    PageViewModel(
      title: "Welcome to \"Basket\"",
      body:
          "Life is hard enough already. Let \"Basket\" make it \na little easier.",
      image: Center(
        child: Image.asset("assets/images/intro-1.png", height: 200.0),
      ),
      decoration: introDecoration,
    ),
    PageViewModel(
      title: "The world’s largest online store.",
      body: "A fresh approach to shopping.",
      image: Center(
        child: Image.asset("assets/images/intro-2.png", height: 200.0),
      ),
      decoration: introDecoration,
    ),
    PageViewModel(
      title: "Let's go to the first shopping...",
      body: "Share \"Basket\" app with your family and friends.",
      image: Center(
        child: Image.asset("assets/images/intro-3.png", height: 200.0),
      ),
      decoration: introDecoration,
    ),
  ];
}
