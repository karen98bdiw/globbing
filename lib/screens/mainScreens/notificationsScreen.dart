import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static final routeName = "NotificationsScreen";
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Color.fromRGBO(81, 84, 89, 1),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Unread",
                      ),
                      Tab(
                        text: "All",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text(
                          "unread",
                        ),
                      ),
                      Center(
                        child: Text(
                          "all",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(81, 84, 89, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.unarchive),
            color: Colors.white,
            onPressed: () {
              //TODO:check all as read;
            },
          )
        ],
      ),
    );
  }
}
