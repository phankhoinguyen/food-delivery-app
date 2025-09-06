import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:food_delivery/features/auth/presentation/cubits/auth_state.dart';

class AuthCubits extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubits({required this.authRepo}) : super(AuthInitial());

  void checkAuth() async {
    final user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user: user));
    } else {
      emit(Unauthenticated());
    }
  }

  //get current user
  AppUser? get currentUser => _currentUser;
  //sign in
  Future<void> signIn(String email, String pass) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, pass);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(msg: e.toString()));
      emit(Unauthenticated());
    }
  }

  //sign up
  Future<void> signUp(String email, String password, String name) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.regisWithEmailPassword(email, password, name);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(msg: e.toString()));
      emit(Unauthenticated());
    }
  }

  // log out
  Future<void> logOut() async {
    await authRepo.logout();
    emit(Unauthenticated());
  }
}
