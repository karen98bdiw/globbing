import 'package:flutter/material.dart';

enum CounterType { Bonus, Balance }

class Counter extends StatelessWidget {
  final double value;
  final CounterType type;

  Counter({this.value, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${type == CounterType.Balance ? "Balance" : "Bonus"}",
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
                    text: "${value.floor()}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: "AMD",
                    style: TextStyle(
                        color: type == CounterType.Balance
                            ? Colors.white
                            : Colors.white54,
                        fontSize: 20),
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
