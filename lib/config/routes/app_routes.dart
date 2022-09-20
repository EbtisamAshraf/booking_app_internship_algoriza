import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/login_screen.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/register_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/home_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/main_screen.dart';
import 'package:booking_app_internship_algoriza/main.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String init = '/';
  static const String loginScreenRoute = "/login";
  static const String registerScreenRoute = "/register";
  static const String exploreScreen = '/explore_screen';
  static const String homeScreen = '/home_screen';
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

      case Routes.exploreScreen:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());

      case Routes.exploreScreen:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());

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
