import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/login_screen.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/register_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/main_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/language_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/profile_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/setting_screen.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/screens/on_boarding_screen.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String init = '/mainScreen';
  static const String loginScreenRoute = "/login";
  static const String registerScreenRoute = "/register";
  static const String profileScreenRoute = "/profile";
  static const String editProfileScreenRoute = "/editProfile";
  static const String settingScreenRoute = "/setting";
  static const String exploreScreen = '/explore_screen';
  static const String languageScreen = '/LanguageScreen';
  static const String onBoardingRoute = '/onBoarding';
  static const String splashScreen = '/';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.init:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.profileScreenRoute:
        ProfileInfoModel profileInfo = settings.arguments as ProfileInfoModel;
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.editProfileScreenRoute:
        ProfileInfoModel profileInfo = settings.arguments as ProfileInfoModel;
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(
                  profileInfo: profileInfo,
                ));

      case Routes.exploreScreen:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());

      case Routes.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
