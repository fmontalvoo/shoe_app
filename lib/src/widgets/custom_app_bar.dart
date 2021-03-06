import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                this.title,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.search, size: 30.0), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
