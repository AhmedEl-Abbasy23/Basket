import 'package:basket/presentation/layout/home_layout.dart';
import 'package:basket/presentation/screens/intro_screen.dart';
import 'package:basket/presentation/screens/login_screen.dart';
import 'package:basket/shared/app_router.dart';
import 'package:basket/data/web_services/dio_web_services.dart';
import 'package:basket/shared/constants/constants.dart';
import 'package:basket/shared/helpers/cache_helper.dart';
import 'package:basket/shared/styles/styles.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'business_logic/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  WebServices.init();
  bool introDone = CacheHelper.getData(key: 'introduction') ?? false;
  token = CacheHelper.getData(key: 'token') ?? '';
  late Widget widget;
  if (introDone) {
    if (token.isNotEmpty) {
      widget = const HomeLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const IntroScreen();
  }
  runApp(
    MainApp(
      appRouter: AppRouter(),
      firstScreen: widget,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key, required this.appRouter, required this.firstScreen})
      : super(key: key);
  final AppRouter appRouter;
  final Widget firstScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: firstScreen,
      onGenerateRoute: appRouter.generateRoute,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 2460,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
    );
  }
}
