import 'package:flutter/material.dart';

extension MapExt on Map<Color, bool> {
  Map<Color, bool> toggleColor(Color color) => this
    ..updateAll(
      (key, value) {
        if (key != color) {
          return false;
        } else {
          return true;
        }
      },
    );

  Map<Color, bool> setAllToFalse() => this
    ..updateAll(
      (key, value) => value = false,
    );
}
