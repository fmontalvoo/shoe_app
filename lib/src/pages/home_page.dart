import 'package:flutter/material.dart';

import 'package:shoes_app/src/widgets/custom_widgets.dart';

import 'package:shoes_app/src/pages/shoe_description_page.dart';

import 'package:shoes_app/src/helpers/helpers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    statusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'For you'),
          SizedBox(height: 20.0),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(
                  tag: 'preview',
                  child: ShoePreview(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ShoeDescriptionPage()));
                    },
                  ),
                ),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          )),
          AddToCart(price: 180.0, text: 'Add to cart')
        ],
      ),
    );
  }
}
