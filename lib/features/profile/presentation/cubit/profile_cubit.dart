// import 'dart:io';
//
// import 'package:bloc/bloc.dart';
// import 'package:booking_app_internship_algoriza/core/error/failures.dart';
// import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
// import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
// import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
// import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/get_profile_info.dart';
// import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit({required this.getProfileInfoUseCase, required this.updateInfoUseCase}) : super(ProfileInitial());
//
//   final GetProfileInfoUseCase getProfileInfoUseCase;
//   final UpdateInfoUseCase updateInfoUseCase;
//   static ProfileCubit get(context) => BlocProvider.of(context);
//
//
//  late ProfileInfoModel profileInfo ;
//
//   getProfileInfo() async{
//     emit(ProfileInfoLoadingState());
//     Either<Failure, ProfileInfoModel> response = await getProfileInfoUseCase();
//     emit(response.fold(
//           (failure) => const ProfileInfoErrorState(
//         AppStrings.serverFailureMsg,
//       ),
//           (data) {
//             profileInfo = data;
//             return ProfileInfoLoadedState(profileInfoModel: data);
//           },
//     ));
//   }
//
//   XFile? image;
//   final ImagePicker _picker = ImagePicker();
//   void pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       image = pickedFile;
//       emit(PickImageSuccessState());
//     }
//   }
//   updateInfo({required UpdateInfoParam updateInfoParam}) async{
//     emit(UpdateProfileInfoLoadingState());
//     Either<Failure, UpdateInfoModel> response = await updateInfoUseCase(updateInfoParam:updateInfoParam );
//     emit(response.fold(
//           (failure) => const UpdateProfileInfoErrorState(
//         AppStrings.serverFailureMsg,
//       ),
//           (data) {
//             return UpdateProfileInfoLoadedState(updateInfoModel: data);
//           },
//     ));
//   }
//
// }
