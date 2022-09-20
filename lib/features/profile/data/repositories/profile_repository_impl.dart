import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/network/network_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/pass_change_Model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/change_password.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ProfileRepositoryImpl implements ProfileRepository {

  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({required this.profileRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PassChangeModel>> changePassword({required ChangePasswordParam changePasswordParam})  async {
    if (await networkInfo.isConnected){
      try {
        final response = await profileRemoteDataSource.changePassword(changePasswordParam: changePasswordParam);
        return Right(response);

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
  Future<Either<Failure, ProfileInfoModel>> getProfileInfo() async {
    if (await networkInfo.isConnected){
      try {
        final response = await profileRemoteDataSource.getProfileInfo();
        return Right(response);
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
  Future<Either<Failure, UpdateInfoModel>> updateInfo({required UpdateInfoParam updateInfoParam}) async {
    if (await networkInfo.isConnected){
      try {
        final response = await profileRemoteDataSource.updateInfo(updateInfoParam: updateInfoParam);
        return Right(response);

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