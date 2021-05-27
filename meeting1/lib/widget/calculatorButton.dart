import 'package:flutter/material.dart';
import 'package:meeting1/style/styleCalculatorElevatedButton.dart';

class CalculatorButton extends StatelessWidget {
  final String? value;
  final Function? function;

  const CalculatorButton({this.value, @required this.function, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = value ?? '';

    return Container(
      child: ElevatedButton(
        onPressed: () => function!(title),
        child: Text(title),
        style: styleCalculationElevatedButton(),
      ),
      padding: EdgeInsets.all(5.0),
    );
  }
}
