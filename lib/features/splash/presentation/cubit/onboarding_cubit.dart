


import 'package:booking_app_internship_algoriza/features/splash/data/models/onboarrding_model.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/cubit/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());



 static OnBoardingCubit get(context)=> BlocProvider.of(context);

 bool isLastIndex = false;
 bool isSkip = false;

 int indexOfOnBoardingPageView = 0;


 changeIndexOfOnBoardingPageView(index ,List<OnBoardingModel> list){
   indexOfOnBoardingPageView = index;

   if (indexOfOnBoardingPageView == list.length - 1){
     isLastIndex = true;
   }else{
     isLastIndex = false;
   }
   emit(ChangeIndexOfOnBoardingPageViewState());
 }

 changeIsSkip(){
   isSkip = true;
   di.sl<SharedPreferences>().setBool('isSkip',isSkip) ;
   emit(ChangeIsSkipState());
   return isSkip;

 }


}
