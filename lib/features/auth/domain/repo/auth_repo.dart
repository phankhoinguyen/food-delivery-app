import 'package:food_delivery/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> regisWithEmailPassword(
    String email,
    String password,
    String name,
  );
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
