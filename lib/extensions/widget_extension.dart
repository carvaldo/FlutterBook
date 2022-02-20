import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  dismissKeyboard(BuildContext inContext) {
    var currentFocus = FocusScope.of(inContext);
    if (currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

  }
}