import 'package:flutter/material.dart';
import 'package:globbing/screens/logScreens/introducingScreen.dart';
import './components/bottomNavigationBar.dart';
import '../logScreens/registerScreens/registerScreen.dart';

import './components/appBar.dart';
import './components/clipper.dart';
import './components/menuScreenActions.dart';

class MenuScreen extends StatelessWidget {
  static final routeName = "MenuScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topBlock(),
            Stack(
              overflow: Overflow.visible,
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    //this container will draw the clipped shape
                    padding: EdgeInsets.only(bottom: 150),
                    color: Color.fromRGBO(81, 84, 89, 1),
                  ),
                ),
                MenuScreenActions(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _bottomContent(context),
          ],
        ),
      ),
      floatingActionButton: BottomNavigation.floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(curentIndex: 2),
    );
  }

  Widget _topBlock() {
    return Container(
      color: Color.fromRGBO(81, 84, 89, 1),
      padding: EdgeInsets.only(bottom: 30),
      child: SafeArea(child: MyAppBar()),
    );
  }

  Widget _bottomContent(ctx) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(ctx).pushReplacementNamed(IntroducingScreen.routeName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Icon(
              Icons.exit_to_app,
              size: 40,
            ),
            Text(
              "Log out",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
