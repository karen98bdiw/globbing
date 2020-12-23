import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static final routeName = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _hidePasswordText = true;

  void _back(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _appBar(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _usualRegisterForm(),
                  SizedBox(
                    height: 15,
                  ),
                  _myDivider(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _fbRegBtn(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _gRegBnt(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("By continuing you agree"),
                GestureDetector(
                  child: Text(
                    "Agreement",
                    style: TextStyle(color: Colors.orange[600]),
                  ),
                )
              ],
            ),
          ],
        ),
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
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 27,
              ),
              onPressed: () => _back(context),
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

  Widget _usualRegisterForm() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5),
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
            height: 15,
          ),
          TextField(
            obscureText: _hidePasswordText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5),
              suffixIcon: IconButton(
                icon: Icon(Icons.warning),
                onPressed: () {
                  setState(() {
                    _hidePasswordText = !_hidePasswordText;
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
            height: 15,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: "123",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: CircleAvatar(
                          radius: 8,
                        ), // myIcon is a 48px-wide widget.
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 8),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Icon(Icons
                            .keyboard_arrow_down), // myIcon is a 48px-wide widget.
                      ),
                      suffixIconConstraints: BoxConstraints(minWidth: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Phone",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              )
            ],
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
              "Continue",
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

  Widget _myDivider() {
    return Row(
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
    );
  }

  Widget _fbRegBtn() {
    return OutlineButton(
        onPressed: () {},
        child: Text(
          "Facebook",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide: BorderSide(
          color: Colors.grey[500],
        ));
  }

  Widget _gRegBnt() {
    return OutlineButton(
        onPressed: () {},
        child: Text(
          "Google",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide: BorderSide(
          color: Colors.grey[500],
        ));
  }
}

//  TextField(
//                   readOnly: true,
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.only(left: 5),
//                     prefixIcon: Icon(Icons.ac_unit),
//                     hintText: "123",
//                     hintStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                     suffixIcon: Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey,
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1),
//                     ),
//                   ),
//                 ),
