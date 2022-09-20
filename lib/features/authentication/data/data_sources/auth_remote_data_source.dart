
import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/login_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/register_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginUser({required LoginUserParam loginUserParam});
  Future<RegisterModel> registerUser({required RegisterParam registerParam});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<LoginModel> loginUser({required LoginUserParam loginUserParam}) async {
    final response =
        await apiConsumer.post(EndPoints.login , body: {
      "email": loginUserParam.email,
      "password": loginUserParam.password
    },).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final LoginModel loginResponse = LoginModel.fromJson(response);
    debugPrint(loginResponse.toString());
    AppStrings.token = loginResponse.data.apiToken!;
    di.sl<SharedPreferences>().setString("token", loginResponse.data.apiToken!);
    return loginResponse;
  }

  @override
  Future<RegisterModel> registerUser(
      {required RegisterParam registerParam}) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      body: {
          "name": registerParam.name,
          "email": registerParam.email,
          "password": registerParam.password ,
          "password_confirmation": registerParam.passwordConfirmation,
          "image": registerParam.image,
      },
    ).onError((error, stackTrace) {
      debugPrint('error = $error');
      throw ServerException;
    });
    debugPrint('response = $response');
    final RegisterModel registerResponse =
        RegisterModel.fromJson(response);
    debugPrint('data = ${registerResponse.data}', wrapWidth: 1024);
    AppStrings.token = registerResponse.data.apiToken!;
    di.sl<SharedPreferences>().setString("token", registerResponse.data.apiToken!);
    return registerResponse;
  }


}


