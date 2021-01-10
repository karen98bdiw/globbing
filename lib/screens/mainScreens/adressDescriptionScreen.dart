import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import '../../providers/userStateProvider.dart';
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

  void _showCopyDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          content: Container(
            child: Text("Copied To Clipboard"),
          ),
        );
      },
    ).timeout(
      Duration(seconds: 1),
      onTimeout: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    country = (ModalRoute.of(context).settings.arguments as Map)['country'];
    return Scaffold(
      appBar: PoorAppBar(title: "Your adress in ${country.name}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
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
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _adressDescriptionView() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            _adressDescriptionItem(
                descriptionsItemTitle: "Recepient",
                descriptionItemText:
                    "${UserStateProvider.curentUser.name} ${UserStateProvider.curentUser.surname}"),
            Divider(),
            ..._adressDescriptionFieldsList()
          ],
        ),
      ),
    );
  }

  List<Widget> _adressDescriptionFieldsList() {
    List<Widget> fieldViewList = [];
    AdressesProvider.adresses[0].adressInfo.forEach((key, value) {
      fieldViewList.add(_adressDescriptionItem(
        descriptionsItemTitle: key.toString(),
        descriptionItemText: value,
      ));
    });
    return fieldViewList;
  }

  Widget _adressDescriptionItem(
      {String descriptionsItemTitle, String descriptionItemText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$descriptionsItemTitle",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("$descriptionItemText"),
          ],
        ),
        _copyButton(copyText: descriptionItemText),
      ],
    );
  }

  Widget _copyButton({copyText}) {
    return OutlineButton(
      onPressed: () {
        FlutterClipboard.copy(copyText);
        _showCopyDialog(context);
      },
      child: Text("copy"),
      textColor: Colors.green,
      borderSide: BorderSide(color: Colors.green),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    );
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
