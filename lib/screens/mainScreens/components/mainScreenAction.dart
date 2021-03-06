import 'package:flutter/material.dart';

class MainScreenAction extends StatelessWidget {
  final String asset;
  final String title;
  final String subtitle;
  final Function callBack;

  MainScreenAction({this.asset, this.title, this.subtitle, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 10,
      child: ListTile(
        onTap: callBack,
        contentPadding: EdgeInsets.all(20),
        leading: Image.asset(
          asset,
          fit: BoxFit.fitHeight,
          color: Colors.black,
        ),
        title: Text(
          "$title",
          style: TextStyle(fontSize: 14),
        ),
        subtitle: Text(
          "$subtitle",
          style: TextStyle(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
