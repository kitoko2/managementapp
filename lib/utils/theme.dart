// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/constant_colors.dart';

class AppManagementTheme {
  static final lightTheme = ThemeData.light().copyWith(
    listTileTheme:
        ListTileThemeData(textColor: Colors.black, style: ListTileStyle.drawer),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      foregroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: "proxima",
        fontSize: Get.width * 0.05,
        color: Colors.black,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ConstantColors.whiteColor,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ConstantColors.primaryColor,
      onPrimary: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true, // this will remove the default content padding
      // now you can customize it here or add padding widget
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ConstantColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(ConstantColors.primaryColor),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ConstantColors.primaryColor,
          width: 2,
        ),
      ),
      labelColor: ConstantColors.primaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(
        color: ConstantColors.primaryColor,
        fontFamily: "proxima",
        fontWeight: FontWeight.w700,
        fontSize: 15.sp,
      ),
      unselectedLabelStyle: TextStyle(
        color: ConstantColors.primaryColor,
        fontFamily: "proxima",
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      ),
    ),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: "proxima",
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: "proxima",
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      ),
    ),
    cardTheme: CardTheme(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.1),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: "proxima",
          color: ConstantColors.primaryColor,
          fontSize: 16.sp,
        ),
      ),
    )),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: "proxima",
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: "proxima",
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontFamily: "proxima",
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontFamily: "proxima",
        fontSize: 13.sp,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontFamily: "proxima",
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontFamily: "proxima",
        color: Colors.black,
      ),
    ),
  );
}
