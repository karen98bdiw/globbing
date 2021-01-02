import 'package:flutter/material.dart';
import 'package:globbing/screens/mainScreens/mainScreensRoot.dart';

import '../../models/deliverCountryModel.dart';
import '../../providers/deliveriCountriesProvider.dart';

class AddOrderScreen extends StatefulWidget {
  static final routeName = "AddOrderScreen";
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final List<DeliveryCountryModel> countries = DeliveryCountries.countries;

  String _trackingNumber;
  String _name;
  double amount;

  var _formState = GlobalKey<FormState>();

  void _back() {
    Navigator.of(context).pop();
  }

  int checkedCountriIndex = 0;
  int checkedDeliveryMethodIndex = 0;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _deliverCountriesView(),
        SizedBox(
          height: 20,
        ),
        _orderForm(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _countinueBtn(),
        ),
      ],
    );
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

  Widget _orderForm() {
    return Form(
      key: _formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value.isEmpty ? "Please write tracking number" : null,
                  onSaved: (newValue) => _trackingNumber = newValue,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Tracking Number",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The method of delivery selected or re-confirmed here will be considered final",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _deliverMethodsView(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value.isEmpty ? "Please write name " : null,
                  onSaved: (newValue) => _name = newValue,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) =>
                      value.isEmpty ? "Please write total amount" : null,
                  onSaved: (newValue) => _trackingNumber = newValue,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Total amount",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _countinueBtn() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pushNamed(MainScreensRoot.routeName);
      },
      child: Text(
        "Continue",
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.symmetric(vertical: 13),
      color: Color.fromRGBO(107, 232, 130, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      textColor: Colors.white,
    );
  }

  Widget _deliverMethodsView() {
    return Container(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return _deliveryMethodViewItem(
            countries[checkedCountriIndex].deliveryMethonds[index],
            index,
          );
        },
        itemCount: countries[checkedCountriIndex].deliveryMethonds.length,
      ),
    );
  }

  Widget _deliveryMethodViewItem(DeliveryMethod m, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedDeliveryMethodIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.only(
            bottom:
                index == checkedDeliveryMethodIndex ? 5 : 0), //for green bottom
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: index == checkedDeliveryMethodIndex
                ? Colors.white
                : Colors.grey[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          padding: EdgeInsets.all(8),
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${m.type}",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${m.duration}",
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
