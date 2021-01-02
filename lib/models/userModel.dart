import 'package:flutter/material.dart';

enum Gender {
  Mail,
  Femail,
}

class UserModel {
  String id;
  String name;
  String surname;
  String mail;
  String password;
  String birtday;
  Gender gender;

  UserModel({
    @required this.name,
    @required this.surname,
    @required this.mail,
    @required this.password,
    this.birtday,
    this.gender,
  });

  set setId(String id) {
    this.id = id;
  }
}
