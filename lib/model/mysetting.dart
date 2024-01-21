import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySetting with ChangeNotifier {
  double _fontSize = 10;
  String _colorHome = 'Blue';
  String _colorBackground = 'White';

  static List<String> listColorHome = <String>['Blue', 'Purple', 'Red', 'Green', 'Yellow'];
  static List<String> listColorBackground = <String>['White', 'Purple', 'Red', 'Green', 'Yellow'];

  set fontSize(newSize) {
    _fontSize = newSize;
    notifyListeners();
  }

  double get fontSize => _fontSize;

  set homeTitleColor(newColor) {
    _colorHome = newColor;
    notifyListeners();
  }

  Color get homeTitleColor {
    switch(_colorHome) {
      case 'Grey': return Colors.grey;
      case 'Purple': return Colors.purple;
      case 'Red': return Colors.red;
      case 'Green': return Colors.green;
      case 'Yellow': return Colors.yellow;
      default: return Colors.blue;
    }
  }

  String get strHomeTitleColor => _colorHome;

  set homeBackgroundColor(newColor) {
    _colorBackground = newColor;
    notifyListeners();
  }

  Color get homeBackgroundColor {
    switch(_colorBackground) {
      case 'Grey': return Colors.grey;
      case 'Purple': return Colors.purple;
      case 'Red': return Colors.red;
      case 'Green': return Colors.green;
      case 'Yellow': return Colors.yellow;
      default: return Colors.white;
    }
  }


  String get strHomeBackgroundColor => _colorBackground;

}