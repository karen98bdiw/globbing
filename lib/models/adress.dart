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

  Map<String, String> get adressInfo {
    return {
      'Address': this.adress,
      'Address2': this.adress2,
      'State': this.state,
      'City': this.city,
      'Postal Code': this.postalCode,
      'Country': this.country.name,
      'Phone': this.phone
    };
  }
}
