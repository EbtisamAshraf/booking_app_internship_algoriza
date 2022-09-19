
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';


class GetProfileInfoUseCase {
  final ProfileRepository repository;

  GetProfileInfoUseCase(this.repository);

  Future<Either<Failure,ProfileInfoModel>> call() async {
    return await repository.getProfileInfo();
  }
}
