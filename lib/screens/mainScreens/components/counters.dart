import 'package:flutter/material.dart';

enum CounterType { Bonus, Balance }

class Counter extends StatelessWidget {
  final String name;
  final double value;
  final CounterType type;

  Counter({this.name, this.value, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$name",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            type == CounterType.Balance
                ? Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                  )
                : Container(),
            SizedBox(
              width: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$value",
                    style: TextStyle(color: Colors.white),
                  ),
                  WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: "AMD",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
