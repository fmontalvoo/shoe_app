import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:shoes_app/src/models/shoe_model.dart';

import 'package:shoes_app/src/widgets/custom_widgets.dart';

import 'package:shoes_app/src/helpers/helpers.dart';

class ShoeDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    statusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'preview', child: ShoePreview(fullScren: true)),
              Positioned(
                  top: 80.0,
                  child: IconButton(
                    iconSize: 60.0,
                    icon: Icon(Icons.chevron_left, color: Colors.white),
                    onPressed: () {
                      statusDark();
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  AddToCart(price: 180.0, text: 'Buy now', fullScren: true),
                  _ChooseColor(),
                  _BottomButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChooseColor extends StatelessWidget {
  _ChooseColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 90,
                    child: _ColorButton(
                      color: Color(0xffffad29),
                      index: 4,
                      asset: 'amarillo',
                    )),
                Positioned(
                    left: 60,
                    child: _ColorButton(
                      color: Color(0xff2099f1),
                      index: 3,
                      asset: 'azul',
                    )),
                Positioned(
                    left: 30,
                    child: _ColorButton(
                      color: Color(0xffc6d642),
                      index: 2,
                      asset: 'verde',
                    )),
                Positioned(
                    child: _ColorButton(
                  color: Color(0xff364d56),
                  index: 1,
                  asset: 'negro',
                )),
              ],
            ),
          ),
          OrangeButton(
            text: 'more related items',
            width: 140.0,
            height: 30.0,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;

  _ColorButton({this.color, this.index, this.asset});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      duration: Duration(milliseconds: 600),
      delay: Duration(microseconds: this.index * 200),
      child: GestureDetector(
        child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        ),
        onTap: () => shoeModel.asset = this.asset,
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomButton(
            icon: Icon(Icons.favorite, color: Colors.red, size: 25.0),
          ),
          _BottomButton(
            icon: Icon(Icons.add_shopping_cart,
                color: Colors.grey.withOpacity(0.5), size: 25.0),
          ),
          _BottomButton(
            icon: Icon(Icons.settings,
                color: Colors.grey.withOpacity(0.5), size: 25.0),
          ),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final Icon icon;

  _BottomButton({this.icon});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: UniqueKey(),
        child: this.icon,
        backgroundColor: Colors.white,
        onPressed: () {});
  }
}
