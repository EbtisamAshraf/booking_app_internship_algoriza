import 'dart:ui';


import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/language_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=> BlocProvider.of<AppCubit>(context);

  bool isDark = true;
  initDarkMode({ bool? isDarkMode }){
       emit(AppInitial());
    if(isDarkMode != null){
      isDark = isDarkMode;
      emit(ChangeDarkStats());
    }else{
      isDark = !isDark;
      di.sl<SharedPreferences>().setBool('isDark', isDark);
      emit(ChangeDarkStats());
    }

    return isDark;
  }

  Languages? language  ;

  var locale = const Locale('en', 'EN');
  changeLanguage(value){
    emit(AppInitial());
    language = value ;

    if(language == Languages.arabia){
      locale =  const Locale('ar', 'AR');

    }
    if (language == Languages.english){
      locale = const Locale('en', 'EN');
    }
    emit(ChangeLanguageState());
    return language;
  }

}
