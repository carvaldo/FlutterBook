import 'package:flutter/material.dart';

Future<String> selectDate(BuildContext inContext, String? inDateString) async {
  var initialDate = DateTime.now();
  if (inDateString != null) {
    var dateParts = inDateString.split(",");
    initialDate = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2])
    );
  }
  var picked = await showDatePicker(
      context: inContext,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
  );
  if (picked != null) {

  }
  return "${picked?.year}, ${picked?.month}, ${picked?.day}";
}