import 'package:flutter/material.dart';

ButtonStyle styleCalculationElevatedButton() {
  return ButtonStyle(
    backgroundColor:
        MaterialStateProperty.resolveWith((states) => Colors.purpleAccent),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.all(30.0),
    ),
    shape: MaterialStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}
