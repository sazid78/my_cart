import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get currentUser  => _auth.currentUser;

  static Future<User> loginAdmin(String email, String password) async{
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }

  static Future<void> logoutAdmin(){
    return _auth.signOut();
  }
}