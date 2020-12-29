import 'package:flutter/material.dart';
import '../../../providers/userStateProvider.dart';
import 'package:provider/provider.dart';
import '../../mainScreens/mainScreensRoot.dart';

class RegisterStep2 extends StatefulWidget {
  static final routeName = "registerStep2";

  @override
  _RegisterStep2State createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
  String uId;

  String name;
  String surname;
  String phone;

  UserStateProvider userState;

  bool _isLoading = false;
  var _formState = GlobalKey<FormState>();

  void _back() {
    Navigator.of(context).pop();
  }

  void _writeUserData() async {
    if (_formState.currentState.validate()) {
      _formState.currentState.save();
      try {
        setState(() {
          _isLoading = true;
        });

        await userState.writeUserData(name, surname, phone, uId);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(MainScreensRoot.routeName);
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print("some error with writint data ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    uId = (ModalRoute.of(context).settings.arguments as Map)['id'];
    print("this is user id ............... $uId");
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
                    Form(
                      key: _formState,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              validator: (value) =>
                                  value.isEmpty ? "please write name" : null,
                              onSaved: (newValue) => name = newValue,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                hintText: "Name",
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
                              validator: (value) =>
                                  value.isEmpty ? "please write surname" : null,
                              onSaved: (newValue) => surname = newValue,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                hintText: "Surname",
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
                              validator: (value) =>
                                  value.isEmpty ? "please write phone" : null,
                              onSaved: (newValue) => phone = newValue,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                hintText: "Phone",
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
                              height: 20,
                            ),
                            FlatButton(
                              onPressed: () {
                                _writeUserData();
                              },
                              child: Text(
                                "Register",
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
                    )
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
              onPressed: () => _back(),
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
