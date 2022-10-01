import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/login_screen.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/register_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/filtter_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/home_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/main_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/search_screen.dart';
import 'package:booking_app_internship_algoriza/features/map/screen/map_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/language_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/profile_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/setting_screen.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/screens/on_boarding_screen.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/screens/splash_screen.dart';
import 'package:booking_app_internship_algoriza/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class Routes {
  static const String init = '/';
  static const String loginScreenRoute = "/login";
  static const String registerScreenRoute = "/register";
  static const String profileScreenRoute = "/profile";
  static const String editProfileScreenRoute = "/editProfile";
  static const String settingScreenRoute = "/setting";
  static const String exploreScreen = '/explore_screen';
  static const String homeScreen = '/home_screen';
  static const String onBoardingRoute = "/OnBoarding";
  static const String splashScreen = "/SplashScreen";
  static const String languageScreen = "/languageScreen";
  static const String mapScreen = "/mapScreen";
  static const String filterScreen = "/filterScreen";
  static const String searchScreen = "/searchScreen";
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

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
  create: (context) => di.sl<HotelsCubit>(),
  child: SearchScreen(),
));

      case Routes.exploreScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => di.sl<HotelsCubit>(),
                  child: ExploreScreen(),
                ));

      case Routes.settingScreenRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.filterScreen:
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
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
