import 'package:flutter/material.dart';

import '../constants/color/app_colors.dart';

final ThemeData dark = ThemeData(
  scaffoldBackgroundColor: AppColors.dark,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.dark,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0x8a000000),
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
      fontSize: 25,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: Color(0x8a000000),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: Color(0x8a000000),
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: Color(0xdd000000),
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: Color(0xdd000000),
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xdd000000),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     minimumSize: const Size(300, 50),
  //     backgroundColor: AppColors.gunPowder,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ),
  // ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    labelStyle: TextStyle(
      color: AppColors.gunPowder,
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      color: AppColors.gunPowder,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: AppColors.orangeRoughy,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.orangeRoughy,
        width: 1.0,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.gunPowder,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.gunPowder,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.gunPowder,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.gunPowder,
        width: 1.0,
      ),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
  ),
);
