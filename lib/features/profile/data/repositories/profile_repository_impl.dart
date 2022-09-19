import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/pass_change_Model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/change_password.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {


  @override
  Future<Either<Failure, PassChangeModel>> changePassword({required ChangePasswordParam changePasswordParam}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileInfoModel>> getProfileInfo() {
    // TODO: implement getProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UpdateInfoModel>> updateInfo({required UpdateInfoParam updateInfoParam}) {
    // TODO: implement updateInfo
    throw UnimplementedError();
  }
}