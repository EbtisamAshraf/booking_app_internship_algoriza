import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/config/themes/app_theme.dart';
import 'package:booking_app_internship_algoriza/main.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'booking',
      theme: appTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}