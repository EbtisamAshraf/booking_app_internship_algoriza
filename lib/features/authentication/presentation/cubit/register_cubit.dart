import 'dart:developer';
import 'package:booking_app_internship_algoriza/core/error/failures.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/authentication/data/models/register_model.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUserUseCase}) : super(RegisterInitial());

  static RegisterCubit get(context) =>BlocProvider.of(context);

  final RegisterUserUseCase registerUserUseCase;
  late final RegisterModel registerModel;

  userRegister({required RegisterParam registerParam}) async{
    emit(RegisterLoadingState());
    Either<Failure, RegisterModel> response = await registerUserUseCase(registerParam: registerParam);
    emit(response.fold(
          (failure) => RegisterErrorState(
        AppStrings.registerErrorMsg,
      ),
          (data) => RegisterLoadedState( data),
    ));
  }

  bool isPasswordVisible = true;
  bool isPasswordConfirmationVisible = true;
  changePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }
  changePasswordConfirmationVisibility(){
    isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
    emit(ChangePasswordConfirmationVisibilityState());
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
