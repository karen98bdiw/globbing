import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: _topContent(context, _expandTopContext, _isExpand)),
        ],
      ),
    );
  }

  Widget _topContent(ctx, _expandCallback, _isExpanded) {
    return Container(
      color: Color.fromRGBO(81, 84, 89, 1),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 30,
        right: 20,
        left: 20,
        bottom:
            80, //80 for covering data + clipper points that is smaller than height
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _appBar(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _balanceCounter(),
              _bonusCounter(),
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
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/thanos.jpeg"),
              backgroundColor: Colors.green,
              radius: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "name surname",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
        Icon(
          Icons.notifications,
          size: 25,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _balanceCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Balance",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Icon(
              Icons.mail_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "0",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "AMD",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bonusCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bonus",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "0",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: " AMD",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print("${size.height}this is path size");
    var path = Path();
    path.lineTo(0, size.height - 40);
    var endPoint = Offset(size.width, size.height - 40);
    var controllPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
