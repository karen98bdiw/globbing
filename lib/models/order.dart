import 'package:flutter/material.dart';
import 'deliverCountryModel.dart';

enum OrderState {
  Entered,
  InWirehouse,
  OnTheWay,
  InArmenia,
  Recieved,
}

class Order {
  final OrderState state;
  final String country;
  final String name;
  final double amount;
  final DelivieryType shippingMethod;
  final String recipient;
  final DateTime date;

  Order({
    @required this.state,
    this.amount,
    this.country,
    this.date,
    this.recipient,
    this.name,
    this.shippingMethod,
  });
}
