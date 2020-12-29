import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../providers/userStateProvider.dart';
import 'package:provider/provider.dart';
import '../mainScreens/mainScreensRoot.dart';
import './widgets/buttons.dart';

class LogInScreen extends StatefulWidget {
  static final routeName = "LogInScreen";

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var _formState = GlobalKey<FormState>();

  var _isLoading = false;

  String _email;
  String _password;

  bool hidePasswordText = true;
  UserStateProvider userStateProvider;

  Future<void> _logIn() async {
    if (_formState.currentState.validate()) {
      _formState.currentState.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await userStateProvider.logIn(_email, _password);

        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(MainScreensRoot.routeName);
        print("alllll waaassss okkkkkk");
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print("errrrooooooorrrr");
      }
    }
  }

  void gLogin() {
    Navigator.of(context).pushNamed(MainScreensRoot.routeName);
  }

  @override
  Widget build(BuildContext context) {
    userStateProvider = Provider.of<UserStateProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
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
                            bottom:
                                -40, //this is the half height of CircleAvatat
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/images/thanos.jpeg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //middle block
                    Container(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top:
                              50), //the top padding is equal positionate image half and also for create visible space
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
                                child: FbButton(
                                  callBack: () => gLogin(),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: GoogleButton(
                                callBack: () => gLogin(),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                    //bottom text
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Not Registred? Register Now ",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _usualLoginForm() {
    return Form(
      key: _formState,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: "test@gmail.com",
              validator: (value) => value.isEmpty ? "Please write email" : null,
              onSaved: (newValue) => _email = newValue,
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
            TextFormField(
              initialValue: "testtest",
              validator: (value) =>
                  value.isEmpty ? "please write password" : null,
              onSaved: (newValue) => _password = newValue,
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
              onPressed: () {
                _logIn();
              },
              child: Text(
                "Login",
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
}
