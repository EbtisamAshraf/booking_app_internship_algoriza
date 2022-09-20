import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';



ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 25,fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      displaySmall:  TextStyle(fontSize: 16,color: Colors.grey),
      bodySmall: TextStyle(fontSize: 16,color: Colors.black),
      bodyMedium: TextStyle(fontSize: 20,color: Colors.black),
      displayMedium:  TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
      headlineLarge:   TextStyle(fontSize: 30) ),
  );

}
