import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      (opacity * 255).round(),
      (_getRed(value)).round(),
      (_getGreen(value)).round(),
      (_getBlue(value)).round(),
    );
  }

  // Extract red component from color value
  double _getRed(double factor) {
    return ((this.value >> 16) & 0xff) * factor;
  }

  // Extract green component from color value
  double _getGreen(double factor) {
    return ((this.value >> 8) & 0xff) * factor;
  }

  // Extract blue component from color value
  double _getBlue(double factor) {
    return (this.value & 0xff) * factor;
  }
}
