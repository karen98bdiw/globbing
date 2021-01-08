import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../providers/ordersProvider.dart';

class MyOrdersScreen extends StatelessWidget {
  static final routeName = "MyOrdersScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 84, 89, 1),
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return OrderTypeViewItem(
              state: OrderState.values[index],
            );
          },
          itemCount: OrderState.values.length,
        ),
      ),
    );
  }
}

class OrderTypeViewItem extends StatelessWidget {
  final OrderState state;

  OrderTypeViewItem({this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(top: 20),
        elevation: 5,
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          leading: Icon(OrdersProvider.getOrderStateIcon(state)),
          title: Text(OrdersProvider.getOrderStateName(state)),
          trailing: Text("0"),
        ),
      ),
    );
  }
}
