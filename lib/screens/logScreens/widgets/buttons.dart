import 'package:flutter/material.dart';

class FbButton extends StatelessWidget {
  final Function callBack;

  FbButton({this.callBack});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        onPressed: () {
          callBack();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/fbIcon.png"),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Facebook",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide: BorderSide(
          color: Colors.grey[500],
        ));
  }
}

class GoogleButton extends StatelessWidget {
  final Function callBack;

  GoogleButton({this.callBack});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        callBack();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/googleIcon.png"),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Google",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      borderSide: BorderSide(
        color: Colors.grey[500],
      ),
    );
  }
}
