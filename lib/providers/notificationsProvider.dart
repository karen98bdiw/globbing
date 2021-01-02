import 'package:flutter/cupertino.dart';

class NotificationItem extends ChangeNotifier {
  final String text;
  final String date;
  bool isRead = false;

  NotificationItem({@required this.text, @required this.date});

  void toogleReadState() {
    isRead = true;
    notifyListeners();
  }
}

class NotificationsProvider extends ChangeNotifier {
  List<NotificationItem> notifications = [
    NotificationItem(
      text: "something1",
      date: DateTime.now().toString(),
    ),
    NotificationItem(
      text: "something2",
      date: DateTime.now().toString(),
    ),
  ];

  void setAllAsRead() {
    notifications.map((e) => e.toogleReadState());
  }
}
