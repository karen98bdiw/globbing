import 'package:flutter/material.dart';
import './bottomSheet.dart';
import '../changePersonalDataScreen.dart';
import '../notificationsScreen.dart';
import '../../../providers/userStateProvider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromRGBO(81, 84, 89, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return ChangeAccountBottomSheet();
                      },
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/thanos.jpeg"),
                        backgroundColor: Colors.green,
                        radius: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${UserStateProvider.curentUser.name} ${UserStateProvider.curentUser.surname}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ChangePersonalDataScreen.routeName);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(NotificationsScreen.routeName);
              },
              child: Icon(
                Icons.notifications,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
