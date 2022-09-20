
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/login_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/register_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/repositories/auth_repository.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';


class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;


  AuthRepositoryImpl({required this.authRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LoginModel>> loginUser({required LoginUserParam loginUserParam}) async {
    if (await networkInfo.isConnected){
      try {
      final userData = await authRemoteDataSource.loginUser(loginUserParam: loginUserParam );
      return Right(userData);

      }
      on ServerException {
        return Left(ServerFailure());
      } catch (e){

        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registerUser({required RegisterParam registerParam}) async{
    if (await networkInfo.isConnected){
      try {
        final userData = await authRemoteDataSource.registerUser(registerParam: registerParam );
        return Right(userData);
      }
      on ServerException {
        return Left(ServerFailure());
      } catch (e){
        debugPrint(e.toString());
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}