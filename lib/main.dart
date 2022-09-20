import 'package:bloc/bloc.dart';
import 'package:booking_app_internship_algoriza/app.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/core/widgets/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  AppStrings.token =  di.sl<SharedPreferences>().getString('token') == null ? '': di.sl<SharedPreferences>().getString('token')!;
  BlocOverrides.runZoned(
        () {
          EasyLocalization(
            path: 'resources/translation',
            supportedLocales: const [
              Locale('ar', 'AR'),
              Locale('en', 'EN'),
            ],
            saveLocale: true,
            child: const MyApp(),
          );
    },
    blocObserver: MyBlocObserver(),
  );
}


