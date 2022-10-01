import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';



ThemeData appTheme() {
  return ThemeData(
    radioTheme: RadioThemeData(
      fillColor:  MaterialStateProperty.all(Colors.black),
    ),
      primaryColor: AppColors.primaryColor,
       scaffoldBackgroundColor: AppColors.backgroundColorLight,
      sliderTheme: const SliderThemeData(
          valueIndicatorColor: Colors.transparent,
          valueIndicatorTextStyle: TextStyle(color: Colors.black)),
      appBarTheme: const AppBarTheme(

        iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 25,fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        displaySmall:  TextStyle(fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(fontSize: 16, color: Colors.black),
        displayMedium: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.black),
      headlineLarge:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 18,color:  Colors.black,fontWeight: FontWeight.bold),
      ),
      cardColor: const Color(0xFFFFFFFF),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColorLight,
      )

  );

}

ThemeData appDarkTheme() {
  return ThemeData(
    radioTheme: RadioThemeData(
      fillColor:  MaterialStateProperty.all(Colors.white),

    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.black38,
    sliderTheme: const SliderThemeData(
        valueIndicatorColor: Colors.transparent,
        valueIndicatorTextStyle: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.white , fontSize: 25,fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        displaySmall:  TextStyle(fontSize: 16,color: Colors.white,),
        displayMedium: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.white,),
      headlineLarge:  TextStyle(fontSize: 22,color: Colors.white,),
      headlineSmall: TextStyle(fontSize: 18,color:  Colors.white,fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 16, color: Colors.white),

    ),

      cardColor: Color(0xFF2C2C2C),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColorDark,
      )
  );

}
