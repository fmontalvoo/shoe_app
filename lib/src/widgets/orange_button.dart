import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;

  OrangeButton(
      {this.width,
      this.height,
      this.color = Colors.orange,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}
