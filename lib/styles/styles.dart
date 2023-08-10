import 'package:flutter/material.dart';

class Styles {
  static const TextStyle default16 = TextStyle(fontSize: 16);

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bold13 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle bold22 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const TextStyle purple = TextStyle(
    color: Color(0xFFA076F2),
  );

  static const TextStyle purpleBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xFFA076F2),
  );

  static const TextStyle grey = TextStyle(
    color: Color(0xFF9E9E9E),
  );

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    chipTheme: ThemeData.dark().chipTheme.copyWith(
        selectedColor: const Color(0xFFA076F2), backgroundColor: Colors.white),
  );
}
