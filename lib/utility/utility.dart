import 'package:flutter/material.dart';

class Utility {
  static Color getColorByType(String type) {
    if (type == "Grass") {
      return Colors.greenAccent;
    }
    if (type == "Fire") {
      return Colors.redAccent;
    }
    if (type == "Water") {
      return Colors.blueAccent;
    }
    if (type == "Psychic") {
      return Colors.indigo;
    } else {
      return Colors.black;
    }
  }
}
