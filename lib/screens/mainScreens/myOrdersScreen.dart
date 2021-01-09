import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../providers/ordersProvider.dart';

import './components/poorAppBar.dart';

class MyOrdersScreen extends StatelessWidget {
  static final routeName = "MyOrdersScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "My Orders"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return _ordersTypeViewItem(
              state: OrderState.values[index],
            );
          },
          itemCount: OrderState.values.length,
        ),
      ),
    );
  }

  Widget _ordersTypeViewItem({OrderState state}) {
    return Card(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      elevation: 5,
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        leading: Icon(OrdersProvider.getOrderStateIcon(state)),
        title: Text(OrdersProvider.getOrderStateName(state)),
        trailing: Text("0"),
      ),
    );
  }
}
