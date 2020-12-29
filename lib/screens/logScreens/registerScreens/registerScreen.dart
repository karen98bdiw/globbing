import 'package:flutter/material.dart';
import 'package:globbing/screens/mainScreens/mainScreensRoot.dart';
import '../widgets/buttons.dart';

import '../../../providers/userStateProvider.dart';
import 'package:provider/provider.dart';

import './registerStep2.dart';

class RegisterScreen extends StatefulWidget {
  static final routeName = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  bool _isLoading = false;

  UserStateProvider userState;

  bool _hidePasswordText = true;

  void _back(context) {
    Navigator.of(context).pop();
  }

  void _register() async {
    if (_formState.currentState.validate()) {
      _formState.currentState.save();
      try {
        setState(() {
          _isLoading = true;
        });
        var user = await userState.singUp(_email, _password);
        var id = user.user.uid;
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context)
            .pushNamed(RegisterStep2.routeName, arguments: {'id': id});
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print("error from register future");
      }
    }
  }

  void gRegister() {
    Navigator.of(context).pushNamed(MainScreensRoot.routeName);
  }

  @override
  Widget build(BuildContext context) {
    userState = Provider.of<UserStateProvider>(context);

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _appBar(context),
                    SizedBox(
                      height: 20,
                    ),
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
                                child: FbButton(
                                  callBack: () => gRegister(),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GoogleButton(
                                  callBack: () => gRegister(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
            ),
    );
  }

  Widget _appBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
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
    return Form(
      key: _formState,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              validator: (value) => value.isEmpty ? "please write email" : null,
              onSaved: (newValue) => _email = newValue,
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
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? "please write password" : null,
              onSaved: (newValue) => _password = newValue,
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
              onPressed: () {
                _register();
              },
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 20),
              ),
              padding: EdgeInsets.symmetric(vertical: 13),
              color: Color.fromRGBO(107, 232, 130, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              textColor: Colors.white,
            ),
          ],
        ),
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
}
