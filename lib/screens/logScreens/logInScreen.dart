import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  static final routeName = "LogInScreen";

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool hidePasswordText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //top block
            Container(
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 40,
                        bottom:
                            70), //the padding is giver for have dark background in the top
                    color: Color.fromRGBO(81, 84, 89, 1),
                    child: Text(
                      "Globbing",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: -40, //this is the half height of CircleAvatat
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/thanos.jpeg"),
                    ),
                  ),
                ],
              ),
            ),
            //middle block
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _usualLoginForm(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        "or use",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _fbLoginBtn(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _gLogInBnt()),
                    ],
                  )
                ],
              ),
            ),
            //bottom text
            Text(
              "Not Registred? Register Now ",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _usualLoginForm() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: hidePasswordText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.warning),
                onPressed: () {
                  setState(() {
                    hidePasswordText = !hidePasswordText;
                  });
                },
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.blue,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsets.symmetric(vertical: 13),
            color: Color.fromRGBO(107, 232, 130, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _fbLoginBtn() {
    return OutlineButton(
        onPressed: () {},
        child: Text(
          "Facebook",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide: BorderSide(
          color: Colors.grey[500],
        ));
  }

  Widget _gLogInBnt() {
    return OutlineButton(
        onPressed: () {},
        child: Text(
          "Google",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide: BorderSide(
          color: Colors.grey[500],
        ));
  }
}
