import 'dart:io';

import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/update_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';


class UpdateInfoUseCase {
  final ProfileRepository repository;

  UpdateInfoUseCase(this.repository);

  Future<Either<Failure,UpdateInfoModel>> call({required UpdateInfoParam updateInfoParam}) async {
    return await repository.updateInfo(updateInfoParam: updateInfoParam);
  }
}
class UpdateInfoParam {
  String name;
  String email;
  File image;

  UpdateInfoParam({required this.name, required this.email, required this.image});
}