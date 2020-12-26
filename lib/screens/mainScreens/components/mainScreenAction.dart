import 'package:flutter/material.dart';

class MainScreenAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function callBack;

  MainScreenAction({this.icon, this.title, this.subtitle, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 10,
      child: ListTile(
        onTap: callBack,
        contentPadding: EdgeInsets.all(20),
        leading: Icon(
          icon,
          size: 60,
          color: Colors.black,
        ),
        title: Text("$title"),
        subtitle: Text(
          "$subtitle",
          style: TextStyle(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
