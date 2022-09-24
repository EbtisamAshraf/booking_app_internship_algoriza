import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/config/themes/app_theme.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool? isDarkMode = false;
    bool? isDarkMode = di.sl<SharedPreferences>().getBool('isDark');
    return BlocProvider(
      create: (context) =>
      di.sl<AppCubit>()
        ..initDarkMode(isDarkMode: isDarkMode),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'booking',
            theme: appTheme(),
            darkTheme: appDarkTheme(),
            themeMode:   AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashScreen,

          );
        },
      ),
    );
  }
}