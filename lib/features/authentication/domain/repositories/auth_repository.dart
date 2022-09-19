

import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/login_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/register_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {

  Future<Either<Failure, LoginModel>>  loginUser({required LoginUserParam loginUserParam});
  Future<Either<Failure, RegisterModel>>  registerUser({required RegisterParam registerParam});



}

