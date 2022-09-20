part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}
class ProfileInfoLoadingState extends ProfileState {}
class ProfileInfoLoadedState extends ProfileState {

  final ProfileInfoModel profileInfoModel;

  const ProfileInfoLoadedState({required this.profileInfoModel});
}

class ProfileInfoErrorState extends ProfileState {
  final String error;
  const ProfileInfoErrorState(this.error);
}