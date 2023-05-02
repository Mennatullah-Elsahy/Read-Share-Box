import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper{
  static FirebaseAuthHelper instance = FirebaseAuthHelper._internal();
  FirebaseAuthHelper._internal();
  FirebaseAuth _auther = FirebaseAuth.instance;

  Future<void> login({required String email,required String password})async{
    await _auther.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register({required String email,required String password}) async{
    await _auther.createUserWithEmailAndPassword(email: email, password: password);
  }
}