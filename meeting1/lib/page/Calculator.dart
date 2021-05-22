import 'package:flutter/material.dart';
import 'package:meeting1/style/styleCalculatorElevatedButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('1'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('2'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('3'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('+'),
                style: styleCalculationElevatedButton(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('4'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('5'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('6'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('-'),
                style: styleCalculationElevatedButton(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('7'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('8'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('9'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('*'),
                style: styleCalculationElevatedButton(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('C'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('0'),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('='),
                style: styleCalculationElevatedButton(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('/'),
                style: styleCalculationElevatedButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
