part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginLoadedState extends LoginState {

  final LoginModel loginModel;

  LoginLoadedState({required this.loginModel});
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
class ChangePasswordVisibilityState extends LoginState {}


