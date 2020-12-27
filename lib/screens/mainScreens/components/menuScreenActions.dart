import 'package:flutter/material.dart';

class MenuScreenActionItem {
  final IconData icon;
  final String title;
  final Function callback;

  MenuScreenActionItem({this.icon, this.title, this.callback});
}

class MenuScreenActions extends StatelessWidget {
  final List<MenuScreenActionItem> actions = [
    MenuScreenActionItem(
      icon: Icons.phone_iphone,
      title: "Calculator",
    ),
    MenuScreenActionItem(
      icon: Icons.monetization_on,
      title: "Transactions",
    ),
    MenuScreenActionItem(
      icon: Icons.person,
      title: "Personal Information",
    ),
    MenuScreenActionItem(
      icon: Icons.recent_actors,
      title: "Recepients",
    ),
    MenuScreenActionItem(
      icon: Icons.location_city,
      title: "Main receiving point",
    ),
  ];
  final List<MenuScreenActionItem> settingsActions = [
    MenuScreenActionItem(
      icon: Icons.settings,
      title: "Settings",
    ),
    MenuScreenActionItem(
      icon: Icons.help,
      title: "Help",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ...actions
                  .map(
                    (e) => ListTile(
                      dense: true,
                      leading: Icon(e.icon),
                      title: Text(e.title),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ...settingsActions
                  .map(
                    (e) => ListTile(
                      dense: true,
                      leading: Icon(e.icon),
                      title: Text(e.title),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  )
                  .toList(),
            ],
          ),
        )
      ],
    );
  }

  Widget _addAction(MenuScreenActionItem action) {
    actions.add(action);
  }
}
