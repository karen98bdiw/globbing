import 'package:flutter/material.dart';

class PoorAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  PoorAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(81, 84, 89, 1),
      title: Text(
        "$title",
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
