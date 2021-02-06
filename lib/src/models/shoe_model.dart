import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _path = 'lib/assets/imgs';
  String _asset = 'azul';
  double _size = 7;

  set asset(String asset) {
    this._asset = asset;
    notifyListeners();
  }

  String get asset => '${this._path}/${this._asset}.png';

  set size(double size) {
    this._size = size;
    notifyListeners();
  }

  double get size => this._size;
}
