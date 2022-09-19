import 'package:bloc/bloc.dart';
import 'package:booking_app_internship_algoriza/app.dart';
import 'package:booking_app_internship_algoriza/core/widgets/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}


