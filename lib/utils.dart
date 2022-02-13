import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext inContext, String? inDateString) {
  var initialDate = DateTime.now();
  if (inDateString != null) {
    var dateParts = inDateString.split(",");
    initialDate = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2])
    );
  }
  return showDatePicker(
      context: inContext,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
  );
}