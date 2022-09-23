import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';



ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(

        iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 25,fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(

      bodyLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      displaySmall:  TextStyle(fontSize: 16),
      displayMedium: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
      headlineLarge:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
      ),


  );

}
