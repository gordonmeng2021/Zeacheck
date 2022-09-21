import 'package:flutter/material.dart';

class MyInputTheme {
  TextStyle _buildTextStyle(
    Color color,
  ) {
    return TextStyle(color: color);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(60)),
        borderSide: BorderSide(color: color, width: 2));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: EdgeInsets.all(20),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        focusedBorder: _buildBorder(Colors.orange),
      );
}
