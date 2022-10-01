import 'dart:ui';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/get_profile_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/language_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.updateInfoUseCase, this.getProfileInfoUseCase) : super(AppInitial());
  final UpdateInfoUseCase updateInfoUseCase;
  final GetProfileInfoUseCase getProfileInfoUseCase;
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

  XFile? image;
  final ImagePicker _picker = ImagePicker();
  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile;
      emit(PickImageSuccessState());
    }
  }
  updateInfo({required UpdateInfoParam updateInfoParam}) async{
    emit(UpdateProfileInfoLoadingState());
    Either<Failure, UpdateInfoModel> response = await updateInfoUseCase(updateInfoParam:updateInfoParam );
    emit(response.fold(
          (failure) => const UpdateProfileInfoErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) {
        return UpdateProfileInfoLoadedState(updateInfoModel: data);
      },
    ));
  }

  late ProfileInfoModel profileInfo ;

  getProfileInfo() async{
    emit(ProfileInfoLoadingState());
    Either<Failure, ProfileInfoModel> response = await getProfileInfoUseCase();
    emit(response.fold(
          (failure) => const ProfileInfoErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) {
        profileInfo = data;
        return ProfileInfoLoadedState(profileInfoModel: data);
      },
    ));
  }

}
