import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/login_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginUserUseCase,

  }) : super(LoginInitial());

  final LoginUserUseCase loginUserUseCase;

  static LoginCubit get(context) => BlocProvider.of(context);

  late final LoginModel loginModel;

  userLogin({required LoginUserParam loginUserParam}) async{
    emit(LoginLoadingState());
    Either<Failure, LoginModel> response = await loginUserUseCase(loginUserParam: loginUserParam);
    emit(response.fold(
          (failure) => LoginErrorState(
            AppStrings.loginErrorMsg,
      ),
          (data) => LoginLoadedState(loginModel:data),
    ));

  }

  bool isPasswordVisible = true;
  changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }

  String msg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMsg;
      case OfflineFailure:
        return AppStrings.offLineFailureMsg;
      default:
        return AppStrings.unexpectedFailureMsg;
    }
  }
}
