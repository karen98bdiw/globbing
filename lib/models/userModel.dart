import 'package:flutter/material.dart';

class User {
  String id;
  String name;
  String surname;
  String mail;
  String password;

  User({
    @required this.name,
    @required this.surname,
    @required this.mail,
    @required this.password,
  });

  set setId(String id) {
    this.id = id;
  }
}
