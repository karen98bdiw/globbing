import 'package:flutter/material.dart';

class ChangePersonalDataScreen extends StatefulWidget {
  static final routeName = "ChangePersonalDataScreen";
  @override
  _ChangePersonalDataScreenState createState() =>
      _ChangePersonalDataScreenState();
}

class _ChangePersonalDataScreenState extends State<ChangePersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Text("personal info screen"),
      ),
    );
  }

  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Color.fromRGBO(81, 84, 89, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Personal detailes",
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  Widget _changeForm() {
    return Column(
      children: [],
    );
  }
}
