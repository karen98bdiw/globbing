import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/userModel.dart' as MyUser;

class UserStateProvider extends ChangeNotifier {
  MyUser.User curentUser;

  Future<UserCredential> logIn(String email, String password) {
    try {
      return FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<void> singUp(String email, String password) async {
    try {
      var user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
