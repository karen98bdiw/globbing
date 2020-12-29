import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/userModel.dart';

class UserStateProvider extends ChangeNotifier {
  UserModel curentUser;

  Future<UserCredential> logIn(String email, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> singUp(String email, String password) async {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> writeUserData(
      String name, String surname, String phone, String uid) {
    return FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        'name': name,
        'surname': surname,
        'phone': phone,
      },
    );
  }
}
