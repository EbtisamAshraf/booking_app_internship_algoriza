part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}
class ChangeDarkStats extends AppState {
  @override
  List<Object> get props => [];
}
class ChangeLanguageState extends AppState {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends AppState {
  @override
  List<Object> get props => [];
}
class ProfileInfoLoadingState extends AppState {}
class ProfileInfoLoadedState extends AppState {

  final ProfileInfoModel profileInfoModel;

  const ProfileInfoLoadedState({required this.profileInfoModel});
}

class ProfileInfoErrorState extends AppState {
  final String error;
  const ProfileInfoErrorState(this.error);
}

class UpdateProfileInfoLoadingState extends AppState {}
class PickImageSuccessState extends AppState {}
class UpdateProfileInfoLoadedState extends AppState {

  final UpdateInfoModel updateInfoModel;

  const UpdateProfileInfoLoadedState({required this.updateInfoModel});
}

class UpdateProfileInfoErrorState extends AppState {
  final String error;
  const UpdateProfileInfoErrorState(this.error);
}