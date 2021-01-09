import 'package:flutter/material.dart';
import './components/poorAppBar.dart';

class AdressDescriptionScreen extends StatelessWidget {
  static final routeName = "AdressDecriptionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Your adress in USA "),
    );
  }
}
