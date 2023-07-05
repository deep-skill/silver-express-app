import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xff031329),
];

class AppTheme {
  final int selectedColor;
  final Brightness brightness;

  AppTheme({this.selectedColor = 0, this.brightness = Brightness.dark})
      : assert(selectedColor >= 0),
        assert(selectedColor <= colorList.length - 1);

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: brightness,
      appBarTheme: const AppBarTheme(centerTitle: true));
}
