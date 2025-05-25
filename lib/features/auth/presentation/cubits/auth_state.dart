import 'package:food_delivery/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

//initial
class AuthInitial extends AuthState {}

// loading
class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final AppUser user;
  Authenticated({required this.user});
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String msg;
  AuthError({required this.msg});
}

class RegisterFailed extends AuthState {}
