import 'package:globbing/models/deliverCountryModel.dart';

class Adress {
  final DeliveryCountryModel country;
  final String adress;
  final String adress2;
  final String state;
  final String city;
  final String postalCode;
  final String phone;
  final String recepient;

  Adress({
    this.recepient,
    this.adress,
    this.adress2,
    this.city,
    this.country,
    this.phone,
    this.postalCode,
    this.state,
  });
}
