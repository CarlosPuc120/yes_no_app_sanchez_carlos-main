
import 'package:flutter/material.dart';

const Color customColor = Color(0xFF0000FF);

const List<Color> colorThemes = [
  customColor,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink,


];

class AppTheme {

  ThemeData theme(){ 
    return ThemeData(useMaterial3: true,
    colorSchemeSeed: colorThemes[1],
    brightness: Brightness.dark
    );
  }

}