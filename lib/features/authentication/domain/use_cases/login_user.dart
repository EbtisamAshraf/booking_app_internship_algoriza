


import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/login_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';


class LoginUserUseCase {
  final AuthRepository repository;

  LoginUserUseCase(this.repository);

  Future<Either<Failure,LoginModel>> call({ required LoginUserParam loginUserParam}) async {
    return await repository.loginUser(loginUserParam: loginUserParam);
  }
}


class LoginUserParam {
  final String email;
  final String password;

  LoginUserParam({required this.email, required this.password});
}

