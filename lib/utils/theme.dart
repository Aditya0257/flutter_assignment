import 'package:flutter/material.dart';
import 'colors.dart';

class MyTheme {
  // static MaterialColor mycolor = const MaterialColor(
  //   0xFF205F20,
  //   <int, Color>{
  //     50: Color(0xFF205F20),
  //     100: Color(0xFF205F20),
  //     200: Color(0xFF205F20),
  //     300: Color(0xFF205F20),
  //     400: Color(0xFF205F20),
  //     500: Color(0xFF205F20),
  //     600: Color(0xFF205F20),
  //     700: Color(0xFF205F20),
  //     800: Color(0xFF205F20),
  //     900: Color(0xFF205F20),
  //   },
  // );
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      // primarySwatch: mycolor,
      primaryColor: AppColors.orange,
      fontFamily: 'RedHat',
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light());
}
