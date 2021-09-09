import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'colors.dart';

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
// in AppBar only.
    iconTheme: IconThemeData(color: Colors.black),
  ),
// In all app without AppBar.
  iconTheme: const IconThemeData(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    backgroundColor: Color(0xfffef9fb),
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(size: 33.0),
    unselectedIconTheme: IconThemeData(size: 24.0),
    selectedLabelStyle: TextStyle(fontSize: 15.0),
    unselectedLabelStyle: TextStyle(fontSize: 12.0),
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    // Text for login and register screens text.
    bodyText1: TextStyle(
      fontSize: 15.0,
      color: Colors.black54,
      fontFamily: 'CairoRegular',
    ),
    // Text for text buttons.
    bodyText2: TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'CairoBold',
    ),
    // Text for questions.
    subtitle1: TextStyle(
      fontSize: 17.0,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: 'CairoSemiBold',
    ),
    // Text for section name.
    subtitle2: TextStyle(
      fontSize: 22.0,
      fontFamily: 'CairoBold',
    ),
    // Text for elevated buttons.
    headline5: TextStyle(
      fontSize: 24.0,
      letterSpacing: 1.5,
      fontFamily: 'CairoSemiBold',
    ),
    // Text for login and register headers.
    headline6: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      fontFamily: 'CairoBold',
    ),
  ),
);

const PageDecoration introDecoration = PageDecoration(
  pageColor: Colors.white,
  titleTextStyle: TextStyle(
    color: defaultColor,
    fontSize: 25.0,
    fontFamily: 'CairoBold',
  ),
  bodyTextStyle: TextStyle(
    fontSize: 17.0,
    color: Colors.black,
    fontFamily: 'CairoRegular',
  ),
);
