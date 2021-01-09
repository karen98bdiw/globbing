import 'package:flutter/material.dart';
import '../../models/deliverCountryModel.dart';
import './components/poorAppBar.dart';
import '../../providers/adressesProvider.dart';

class AdressDescriptionScreen extends StatefulWidget {
  static final routeName = "AdressDecriptionScreen";

  @override
  _AdressDescriptionScreenState createState() =>
      _AdressDescriptionScreenState();
}

class _AdressDescriptionScreenState extends State<AdressDescriptionScreen> {
  DeliveryCountryModel country;

  var _checkedDeliveryTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    country = (ModalRoute.of(context).settings.arguments as Map)['country'];

    return Scaffold(
      appBar: PoorAppBar(title: "Your adress in ${country.name}"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _deliveryTypesView(),
            SizedBox(
              height: 20,
            ),
            _adressDescriptionView(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _adressDescriptionView() {
    return Card();
  }

  Widget _deliveryTypesView() {
    return country.deliveryMethonds.length == 0
        ? Container()
        : Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                color: Color.fromRGBO(81, 84, 89, 1),
                // padding: EdgeInsets.only(bottom: 80),
                height: 80,
              ),
              Container(
                height: 80,
                // padding: EdgeInsets.only(bottom: 80),
                margin: EdgeInsets.only(top: 40),
                child: _deliveryTypesList(country),
              )
            ],
          );
  }

  Widget _deliveryTypesList(DeliveryCountryModel m) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return _deliveryTypeViewItem(
          deliveryMethod: m.deliveryMethonds[index],
          index: index,
        );
      },
      itemCount: m.deliveryMethonds.length,
    );
  }

  Widget _deliveryTypeViewItem({DeliveryMethod deliveryMethod, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checkedDeliveryTypeIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.only(
            bottom:
                _checkedDeliveryTypeIndex == index ? 5 : 0), //for green bottom
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: index == _checkedDeliveryTypeIndex
                ? Colors.white
                : Colors.grey[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          padding: EdgeInsets.all(8),
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.shopping_basket),
              SizedBox(
                height: 10,
              ),
              Text(
                "${deliveryMethod.type}  ",
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

  Widget _bottomBar() {
    return BottomAppBar(
      color: Color.fromRGBO(81, 84, 89, 1),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.error_outline),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "IMPORTANT TO KNOW",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.help_outline),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "IMPORTANT TO USE ADRESS",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
