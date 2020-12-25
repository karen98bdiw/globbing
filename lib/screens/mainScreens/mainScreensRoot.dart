import 'package:flutter/material.dart';

import './components/clipper.dart';
import './components/appBar.dart';
import './components/counters.dart';

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
              Container(
                color: Color.fromRGBO(81, 84, 89, 1),
                padding: EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                child: _topContent(context, _expandTopContext, _isExpand),
              ),
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
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNav() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // notchMargin: 10,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () {}),
                Text("Main")
              ],
            ),
            Text("Enter Order"),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                Text("Menu"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _topContent(ctx, _expandCallback, _isExpanded) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
          child: MyAppBar(),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Counter(
              name: "Balance",
              value: 0,
              type: CounterType.Balance,
            ),
            Counter(
              name: "Bouns",
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
        _isExpanded ? _myDivider() : Container(),
        _isExpanded ? _fillActionsView() : Container(),
      ],
    );
  }

  Widget _mainContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Card(
            elevation: 10,
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              leading: Icon(
                Icons.shop,
                size: 60,
              ),
              title: Text("My Orders"),
              subtitle: Text("No orders yet"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 10,
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              leading: Icon(
                Icons.location_on,
                size: 60,
              ),
              title: Text("My Adresses"),
              subtitle: Text("Adresses in 7 countries"),
            ),
          )
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    height: 10,
                  ),
                  Text("shops"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: VerticalDivider(
                thickness: 2,
                width: 0,
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Buy for me"),
                ],
              ),
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
