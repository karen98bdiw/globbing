import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static final routeName = "RegisterScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(context),
        ],
      ),
    );
  }

  Widget _appBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        color: Color.fromRGBO(81, 84, 89, 1),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          bottom: 20,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 27,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(107, 232, 130, 1),
                  child: Icon(Icons.pan_tool),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "REGISTRATION",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "1/3 Create account",
                      style: TextStyle(
                        color: Color.fromRGBO(107, 232, 130, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
