import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';



ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 18)),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      displaySmall:  TextStyle(fontSize: 16),
      displayMedium:  TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
      headlineLarge:   TextStyle(fontSize: 30) ),
  );

}
