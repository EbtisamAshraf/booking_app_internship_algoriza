import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/pass_change_Model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/change_password.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

abstract class ProfileRemoteDataSource {
  Future<ProfileInfoModel>  getProfileInfo();
  Future<UpdateInfoModel>  updateInfo({required UpdateInfoParam updateInfoParam});
  Future<PassChangeModel>  changePassword({required ChangePasswordParam changePasswordParam});

}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ApiConsumer apiConsumer;
  ProfileRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<PassChangeModel> changePassword({required ChangePasswordParam changePasswordParam}) async{
    final response = await apiConsumer.post(EndPoints.passChange,body: {
      'password':changePasswordParam.password,
      'password_confirmation': changePasswordParam.passwordConfirmation,
      'email':changePasswordParam.email,
    },header: {'token': AppStrings.token}).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final PassChangeModel passChangeModel =
    PassChangeModel.fromJson(response);
    debugPrint('data = ${passChangeModel.data}', wrapWidth: 1024);
    return passChangeModel;
  }

  @override
  Future<ProfileInfoModel> getProfileInfo() async {
    final response = await apiConsumer.get(EndPoints.profileInfo,header: {'token': AppStrings.token}).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final ProfileInfoModel profileInfoModel =
    ProfileInfoModel.fromJson(response);
    debugPrint('data = ${profileInfoModel.data}', wrapWidth: 1024);
    return profileInfoModel;
  }

  @override
  Future<UpdateInfoModel> updateInfo({required UpdateInfoParam updateInfoParam})  async{
    final response = await apiConsumer.post(EndPoints.updateInfo,isMultipart: true,
      body: FormData.fromMap({
        'name': updateInfoParam.name,
        'email': updateInfoParam.email,
        'image': await MultipartFile.fromFile(
          updateInfoParam.image.path,
          filename: Uri.file(updateInfoParam.image.path).pathSegments.last,
        ),
      }),

      header: {'token': AppStrings.token,},).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final UpdateInfoModel updateInfoModel =
    UpdateInfoModel.fromJson(response);
    debugPrint('data = ${updateInfoModel.data}', wrapWidth: 1024);
    return updateInfoModel;
  }
}

