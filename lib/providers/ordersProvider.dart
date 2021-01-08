import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/deliverCountryModel.dart';

class OrdersProvider {
  static List<Order> orders = [
    Order(
      state: OrderState.Entered,
      name: "test",
      amount: 99,
      country: "USA",
      date: DateTime.now(),
      recipient: "test User",
      shippingMethod: DelivieryType.Express,
    )
  ];

  static List<IconData> ordersStateIcons = [
    Icons.work,
    Icons.add_to_home_screen,
    Icons.airplanemode_active,
    Icons.location_on,
    Icons.receipt,
  ];

  static IconData getOrderStateIcon(OrderState o) {
    var deliveryTypeIndex = OrderState.values.indexOf(o);
    return ordersStateIcons[deliveryTypeIndex];
  }

  static String getOrderStateName(OrderState o) {
    String orderStateName;
    switch (o) {
      case OrderState.Entered:
        {
          orderStateName = "Entered";
        }
        break;
      case OrderState.InArmenia:
        {
          orderStateName = "In Armenia";
        }
        break;
      case OrderState.InWirehouse:
        {
          orderStateName = "In Wirehouse";
        }
        break;
      case OrderState.OnTheWay:
        {
          orderStateName = "On The Way";
        }
        break;
      case OrderState.Recieved:
        {
          orderStateName = "Recieved";
        }

        break;

      default:
        {
          orderStateName = "not finded";
        }
        break;
    }

    return orderStateName;
  }
}
