import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
  Colors.white,
];

class AppTheme {

  final int selectedColor;
  final Brightness brightness;

  AppTheme({
    this.selectedColor = 0,
    this.brightness = Brightness.dark
  }): assert(selectedColor >= 0),
      assert(selectedColor <= colorList.length - 1);

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    brightness: brightness,
    appBarTheme: const AppBarTheme(
      centerTitle: true
    )
  );

}