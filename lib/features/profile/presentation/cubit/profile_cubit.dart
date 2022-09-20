import 'package:bloc/bloc.dart';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/get_profile_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getProfileInfoUseCase, required this.updateInfoUseCase}) : super(ProfileInitial());

  final GetProfileInfoUseCase getProfileInfoUseCase;
  final UpdateInfoUseCase updateInfoUseCase;

  getProfileInfo() async{
    emit(ProfileInfoLoadingState());
    Either<Failure, ProfileInfoModel> response = await getProfileInfoUseCase();
    emit(response.fold(
          (failure) => const ProfileInfoErrorState(
        AppStrings.serverFailureMsg,
      ),
          (data) => ProfileInfoLoadedState(profileInfoModel: data),
    ));
  }

}
