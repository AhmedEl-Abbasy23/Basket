import 'package:basket/business_logic/cubit/introduction_cubit/introduction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroductionCubit(),
      child: BlocConsumer<IntroductionCubit, IntroductionState>(
        listener: (context, state) {},
        builder: (context, state) {
          var inCubit = IntroductionCubit.get(context);
          return Scaffold(
            body: IntroductionScreen(
              pages: inCubit.screens,
              onDone: () {
                inCubit.submit(context);
              },
              onSkip: () {
                inCubit.submit(context);
              },
              showSkipButton: true,
              skip: const Icon(Icons.skip_next),
              next: const Icon(Icons.arrow_forward_ios),
              done: const Text(
                "Done",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              skipColor: const Color(0xfff62279),
              nextColor: const Color(0xfff62279),
              doneColor: const Color(0xfff62279),
              globalBackgroundColor: Colors.white,
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: const Color(0xfff62279),
                color: const Color(0xfffba6c9),
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
