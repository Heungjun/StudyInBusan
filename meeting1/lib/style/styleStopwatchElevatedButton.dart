import 'package:flutter/material.dart';

ButtonStyle styleStopwatchElevatedButton() {
  return ButtonStyle(
    backgroundColor:
        MaterialStateProperty.resolveWith((states) => Colors.purple),
    shape: MaterialStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}
