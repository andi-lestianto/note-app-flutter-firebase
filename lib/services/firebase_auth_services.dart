import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerAccount(
      {required String email, required String password}) async {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future loginAccount({required String email, required String password}) async {
    var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }
}
