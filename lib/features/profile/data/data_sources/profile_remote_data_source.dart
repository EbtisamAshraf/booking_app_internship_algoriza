import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/pass_change_Model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/change_password.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
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
    throw UnimplementedError();
  }

  @override
  Future<ProfileInfoModel> getProfileInfo() async {
    final response = await apiConsumer.get(EndPoints.profileInfo,header: {'token': AppStrings.token});
    throw UnimplementedError();
  }

  @override
  Future<UpdateInfoModel> updateInfo({required UpdateInfoParam updateInfoParam})  async{
    // TODO: implement updateInfo
    throw UnimplementedError();
  }
}

