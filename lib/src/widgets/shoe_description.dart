import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  ShoeDescription({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(this.title,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700)),
            SizedBox(height: 20.0),
            Text(this.description,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black54, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
