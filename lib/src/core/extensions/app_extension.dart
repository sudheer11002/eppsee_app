import 'package:flutter/material.dart';

extension TextScaling on BuildContext {
  double scaleFont(double baseFontSize) {
    double scaleFactor = MediaQuery.of(this).size.width /
        375.0; // Default base width (e.g., iPhone 11 width)
    // Clamp the scale factor to prevent drastic changes
    scaleFactor = scaleFactor.clamp(0.9, 1.1); // Adjust as needed
    return baseFontSize * scaleFactor;
  }
}
