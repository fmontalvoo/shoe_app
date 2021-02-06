import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:shoes_app/src/widgets/orange_button.dart';

class AddToCart extends StatelessWidget {
  final double price;
  final String text;
  final bool fullScren;

  AddToCart({this.price, this.text, this.fullScren = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
            color: this.fullScren
                ? Colors.transparent
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100.0)),
        child: Row(
          children: [
            SizedBox(width: 20.0),
            Text('\$$price',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              from: 8.0,
              duration: Duration(seconds: 1),
              child: OrangeButton(
                text: this.text,
                width: this.fullScren ? 120.0 : 150.0,
                height: this.fullScren ? 40.0 : 50.0,
              ),
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}
