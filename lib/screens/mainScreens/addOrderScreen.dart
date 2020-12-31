import 'package:flutter/material.dart';

import '../../models/deliverCountryModel.dart';
import '../../providers/deliveriCountriesProvider.dart';

class AddOrderScreen extends StatefulWidget {
  static final routeName = "AddOrderScreen";
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final List<DeliveryCountryModel> countries = DeliveryCountries.countries;

  void _back() {
    Navigator.of(context).pop();
  }

  int checkedCountriIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return PreferredSize(
      child: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(81, 84, 89, 1),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: _back,
        ),
        title: Text(
          "Enter Order",
          style: TextStyle(color: Colors.white),
        ),
      ),
      preferredSize: Size.fromHeight(
        kToolbarHeight,
      ),
    );
  }

  Widget _body() {
    return _deliverCountriesView();
  }

  Widget _deliverCountriesView() {
    return Stack(
      children: [
        Container(
          height: 80,
          color: Color.fromRGBO(81, 84, 89, 1),
          width: double.infinity,
        ),
        Container(
          height: 80,
          margin: EdgeInsets.only(top: 40), //half width
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return _countriViewItem(
                countries[index],
                index,
              );
            },
            itemCount: countries.length,
          ),
        )
      ],
    );
  }

  Widget _countriViewItem(DeliveryCountryModel model, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedCountriIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.only(
            bottom: index == checkedCountriIndex ? 5 : 0), //for green bottom
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color:
                index == checkedCountriIndex ? Colors.white : Colors.grey[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          padding: EdgeInsets.all(8),
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(
                  model.iconAssets,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${model.name}",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
