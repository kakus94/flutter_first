import 'package:flutter/material.dart';

enum TodoPriority {
  low(
      Icon(
        Icons.arrow_downward,
        color: Color.fromARGB(255, 229, 243, 33),
      ),
      "Niski"),
  normal(
      Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 33, 243, 54),
      ),
      "Normalny"),
  high(
      Icon(
        Icons.arrow_upward,
        color: Color.fromARGB(255, 243, 51, 33),
      ),
      "Wysoki");

  const TodoPriority(this.icon, this.text);
  final Icon icon;
  final String text;
}
