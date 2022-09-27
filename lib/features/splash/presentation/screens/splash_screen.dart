import 'dart:async';
import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  startDelay() {
    timer = Timer(const Duration(seconds: 3), nextScreen);
  }

  nextScreen() async {
   // bool? isSkip =  false;
     bool? isSkip =  di.sl<SharedPreferences>().getBool('isSkip');
    AppStrings.token =  di.sl<SharedPreferences>().getString('token') ?? "";

    if (isSkip == true) {
      if (AppStrings.token.isEmpty) {
        Navigator.pushReplacementNamed(
          context,
          Routes.loginScreenRoute,
        );
      } else{
        Navigator.pushReplacementNamed(
            context,
            Routes.init);
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.onBoardingRoute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(180),
           child:Image.asset(ImageAssets.splash),

        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
