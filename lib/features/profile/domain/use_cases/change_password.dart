import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/pass_change_Model.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';


class ChangePasswordUseCase {
  final ProfileRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure,PassChangeModel>> call({required ChangePasswordParam changePasswordParam}) async {
    return await repository.changePassword(changePasswordParam: changePasswordParam);
  }
}

class ChangePasswordParam {
  String password;
  String passwordConfirmation;
  String email;

  ChangePasswordParam({required this.password, required this.passwordConfirmation, required this.email});
}