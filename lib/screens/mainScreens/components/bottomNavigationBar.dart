import 'package:flutter/material.dart';

import '../mainScreensRoot.dart';
import '../menuScreen.dart';

import '../addOrderScreen.dart';

class BottomNavigationItem extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final int initialIndex;
  final Function callBack;

  var color;

  BottomNavigationItem(
      {this.initialIndex, this.index, this.title, this.icon, this.callBack});

  @override
  Widget build(BuildContext context) {
    color = index == initialIndex ? Colors.black : Colors.black38;
    return InkWell(
      onTap: index == initialIndex ? null : callBack,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$title",
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final int curentIndex;

  BottomNavigation({@required this.curentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // notchMargin: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BottomNavigationItem(
              icon: Icons.home,
              title: "Main",
              initialIndex: curentIndex,
              index: 1,
              callBack: () => Navigator.of(context)
                  .pushReplacementNamed(MainScreensRoot.routeName),
            ),
            Text(
              "Enter Order",
              style: TextStyle(
                color: Colors.blue[400],
              ),
            ),
            BottomNavigationItem(
              icon: Icons.menu,
              title: "Menu",
              initialIndex: curentIndex,
              index: 2,
              callBack: () => Navigator.of(context)
                  .pushReplacementNamed(MenuScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }

  static Widget floatingButton(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AddOrderScreen.routeName);
      },
      backgroundColor: Colors.deepOrange,
      child: Icon(
        Icons.add,
        size: 40,
      ),
    );
  }
}
