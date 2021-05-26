import 'package:flutter/material.dart';
import 'package:meeting1/style/styleCalculatorElevatedButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  EdgeInsets buttonPadding = EdgeInsets.all(5.0);
  int result = 0;
  String equation = "";
  double equationTextFontSize = 40;

  List<num> numbers = [];
  List<String> opers = [];
  List<String> postpix = [];
  num number = 0;
  String oper = '';

  void errorMessage(String text) => Fluttertoast.showToast(msg: text);

  void btnOnclick(String key) {
    // valdation check 1. / 0
    if (oper == '/' && key == '0') {
      errorMessage('0으로 나눌 수 없습니다.');
      return;
    }

    setState(() {
      if (key == 'C' || key == '=') {
        if (key == '=') {
          numbers.add(number);
          String st = 'st: ';
          numbers.forEach((element) => st += '$element, ');
          opers.forEach((element) => st += '$element, ');
          print(st);
        }
        equation = "";
        number = 0;
        oper = '';
        numbers.clear();
        opers.clear();
        equationTextFontSize = 40;
        return;
      }

      if (key == '+' || key == '-' || key == '/' || key == '*') {
        if (number == 0) return;

        numbers.add(number);
        number = 0;
        opers.add(key);
        oper = key;
        equation += key;
      } else {
        number = number * 10 + int.parse(key);
        if (number != 0) equation += key;
      }

      if (equation.length >= 10) equationTextFontSize = 22;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 150,
              child: Text(
                equation,
                style: TextStyle(
                    color: Colors.white, fontSize: equationTextFontSize),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('1'),
                  child: Text('1'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('2'),
                  child: Text('2'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('3'),
                  child: Text('3'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('+'),
                  child: Text('+'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('4'),
                  child: Text('4'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('5'),
                  child: Text('5'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('6'),
                  child: Text('6'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('-'),
                  child: Text('-'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('7'),
                  child: Text('7'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('8'),
                  child: Text('8'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('9'),
                  child: Text('9'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('*'),
                  child: Text('*'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('C'),
                  child: Text('C'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('0'),
                  child: Text('0'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('='),
                  child: Text('='),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => btnOnclick('/'),
                  child: Text('/'),
                  style: styleCalculationElevatedButton(),
                ),
                padding: buttonPadding,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
