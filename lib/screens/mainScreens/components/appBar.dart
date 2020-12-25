import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/thanos.jpeg"),
                backgroundColor: Colors.green,
                radius: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "name surname",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
          Icon(
            Icons.notifications,
            size: 25,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
