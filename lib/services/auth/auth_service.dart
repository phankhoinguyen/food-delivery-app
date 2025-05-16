import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of authen
  final _auth = FirebaseAuth.instance;
  // sign in
  Future<void> signIn(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  // log out
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
