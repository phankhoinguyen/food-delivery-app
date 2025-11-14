import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class FirebaseAuthRepo implements AuthRepo {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      //notification init
      final token = await currentUser.getIdToken();
      logger.w(token);
    } else {
      return null;
    }

    // if (currentUser == null) return null;
    return AppUser(uid: currentUser.uid, email: currentUser.email!, name: '');
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await userCredential.user!.getIdToken();
      logger.w(token);
      return AppUser(uid: userCredential.user!.uid, email: email, name: '');
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<AppUser?> regisWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );
      await _db.collection('user').doc(user.uid).set(user.toJson());
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
