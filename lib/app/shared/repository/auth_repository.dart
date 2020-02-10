import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  Stream<FirebaseUser> isLogin;

  Future<FirebaseUser> createUser(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      return user;
    } catch (e) {
      return Future.error(e.message);
    }
  }

  Future<FirebaseUser> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      return user;
    } catch (e) {
      return Future.error(e.message);
    }
  }

  Future logout() async {
    await _auth.signOut();
  }

  Future<FirebaseUser> getUser() => _auth.currentUser();
}
