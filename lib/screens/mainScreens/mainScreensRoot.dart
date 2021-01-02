import 'package:flutter/material.dart';

import './components/clipper.dart';
import './components/appBar.dart';
import './components/counters.dart';
import './components/mainScreenAction.dart';
import './components/bottomNavigationBar.dart';

class MainScreensRoot extends StatefulWidget {
  static final routeName = "MainScreensRoot";
  @override
  _MainScreensRootState createState() => _MainScreensRootState();
}

class _MainScreensRootState extends State<MainScreensRoot> {
  var _isExpand = false; //for show or close after divider part

  void _expandTopContext() {
    setState(() {
      _isExpand = !_isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _topContent(context, _expandTopContext, _isExpand),
              Stack(
                overflow: Overflow.visible,
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      //this container will draw the clipped shape
                      padding: EdgeInsets.only(bottom: _isExpand ? 70 : 150),
                      color: Color.fromRGBO(81, 84, 89, 1),
                    ),
                  ),
                  Container(
                    margin: _isExpand
                        ? EdgeInsets.only(top: 40)
                        : EdgeInsets.only(top: 20),
                    child: _mainContent(),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _bottomContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        curentIndex: 1,
      ),
      floatingActionButton: BottomNavigation.floatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _topContent(ctx, _expandCallback, _isExpanded) {
    return Container(
      color: Color.fromRGBO(81, 84, 89, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: MyAppBar(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color.fromRGBO(81, 84, 89, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Counter(
                  value: 0,
                  type: CounterType.Balance,
                ),
                Counter(
                  value: 0,
                  type: CounterType.Bonus,
                ),
                GestureDetector(
                  onTap: () {
                    _expandCallback();
                  },
                  child: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          _isExpanded ? _myDivider() : Container(),
          _isExpanded ? _fillActionsView() : Container(),
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          MainScreenAction(
            title: "My Orders",
            subtitle: "No orders yet",
            asset: "assets/icons/order.png",
            callBack: () => print("My orders"),
          ),
          SizedBox(
            height: 20,
          ),
          MainScreenAction(
            title: "My Adresses",
            subtitle: "Adresses in 7 countries",
            asset: "assets/icons/location.png",
            callBack: () => print("My Adresses"),
          ),
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Container(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/icons/shopIcon.png",
                  height: 30,
                  color: Colors.blue[200],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Shops",
                  style: TextStyle(color: Colors.blue[200]),
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            VerticalDivider(
              thickness: 1,
              width: 0,
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                Image.asset(
                  "assets/icons/shopping-cart.png",
                  height: 30,
                  color: Colors.blue[200],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Buy for me",
                  style: TextStyle(
                    color: Colors.blue[200],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fillActionsView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _fillBalanceBtn(),
          SizedBox(
            height: 10,
          ),
          _fillBonusBtn(),
          SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                  child: Container(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.restore,
                  color: Colors.white,
                ),
              )),
              TextSpan(text: "Last Transactions"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _fillBalanceBtn() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        "Fill Balance",
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color.fromRGBO(107, 232, 130, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      textColor: Colors.white,
    );
  }

  Widget _fillBonusBtn() {
    return OutlineButton(
      onPressed: () {},
      child: Text(
        "Fill with Bonus",
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      borderSide: BorderSide(color: Color.fromRGBO(107, 232, 130, 1), width: 2),
    );
  }

  Widget _myDivider() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey,
          height: 2,
        )
      ],
    );
  }
}
