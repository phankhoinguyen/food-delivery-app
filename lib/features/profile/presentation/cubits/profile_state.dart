import 'package:food_delivery/features/profile/domain/entities/user_profile.dart';

abstract class ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile user;
  ProfileLoaded(this.user);
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String msg;
  ProfileError(this.msg);
}

class ProfileInitial extends ProfileState {}
