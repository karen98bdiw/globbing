import 'package:flutter/material.dart';
import 'package:globbing/models/deliverCountryModel.dart';

import '../../providers/deliveriCountriesProvider.dart';

import './components/poorAppBar.dart';

class MyAdressesScreen extends StatelessWidget {
  static final routeName = "MyAdressesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(
        title: "My Adresses",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return _adressViewItem(
              DeliveryCountries.countries[index],
            );
          },
          itemCount: DeliveryCountries.countries.length,
        ),
      ),
    );
  }

  Widget _adressViewItem(DeliveryCountryModel d) {
    return Card(
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      elevation: 5,
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          backgroundImage: AssetImage(d.iconAssets),
        ),
        title: Text(d.name),
      ),
    );
  }
}
