import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoes_app/src/models/shoe_model.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScren;
  final void Function() onTap;

  ShoePreview({this.fullScren = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: this.fullScren ? 5.0 : 30.0,
            vertical: this.fullScren ? 5.0 : 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius: !this.fullScren
                ? BorderRadius.circular(50.0)
                : BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
          ),
          child: Column(
            children: [
              _Shoe(),
              if (!this.fullScren) _ShoeSize(),
              SizedBox(height: this.fullScren ? 15 : 30),
            ],
          ),
        ),
      ),
      onTap: this.onTap,
    );
  }
}

class _Shoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(bottom: 20.0, right: 0.0, child: _ShadowShoe()),
          Image(
            image: AssetImage(shoeModel.asset),
          ),
        ],
      ),
    );
  }
}

class _ShadowShoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250.0,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40.0)]),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Size(size: 7.0),
          _Size(size: 7.5),
          _Size(size: 8.0),
          _Size(size: 8.5),
          _Size(size: 9.0),
          _Size(size: 9.5),
        ],
      ),
    );
  }
}

class _Size extends StatelessWidget {
  final double size;

  _Size({this.size});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (this.size == shoeModel.size)
                ? Color(0xfff1a23a)
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              if (this.size == shoeModel.size)
                BoxShadow(
                    color: Color(0xffeaa14e),
                    blurRadius: 10.0,
                    offset: Offset(0, 5)),
            ]),
        child: Text(
          '$size'.replaceAll('.0', ''),
          style: TextStyle(
              color: (this.size == shoeModel.size)
                  ? Colors.white
                  : Color(0xfff1a23a),
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      ),
      onTap: () => shoeModel.size = this.size,
    );
  }
}
