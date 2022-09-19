
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/register_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';


class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<Either<Failure,RegisterModel>> call({required RegisterParam registerParam}) async {
    return await repository.registerUser(registerParam: registerParam);
  }
}


class RegisterParam {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String image;

  RegisterParam(
      {required this.name,
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.image});
}