import 'package:flutter/material.dart';
import 'package:meeting1/style/styleCalculatorElevatedButton.dart'; //todo:delete
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeting1/widget/calculatorButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

//TODO: 로직 간소화하고 깔금하게 만들기
class _CalculatorState extends State<Calculator> {
  //TODO: delete
  EdgeInsets buttonPadding = EdgeInsets.all(5.0);
  String equation = "";
  double equationTextFontSize = 40;

  List<num> numbers = [];
  List<String> opers = [];
  num number = 0;

  List<String> calculatorButtons = [
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    'C',
    '0',
    '=',
    '/'
  ];

  void errorMessage(String text) => Fluttertoast.showToast(msg: text);

  void btnOnclick(String key) {
    // valdation check 1. / 0
    if (opers.isNotEmpty && opers.last == '/' && key == '0') {
      errorMessage('0으로 나눌 수 없습니다.');
      return;
    }

    setState(() {
      if (key == 'C' || key == '=') {
        if (key == '=') {
          if (opers.isEmpty) return;
          if (opers.length > numbers.length) return;

          if (opers.last == '*') {
            if (number == 0) number = 1;
            numbers.last = numbers.last * number;
            opers.removeLast();
          } else if (opers.last == '/') {
            if (number == 0) number = 1;
            numbers.last = numbers.last / number;
            opers.removeLast();
          } else {
            numbers.add(number);
          }

          num result = numbers.first;

          for (int i = 0, loopCnt = opers.length; i < loopCnt; i++) {
            if (opers[i] == '+')
              result += numbers[i + 1];
            else if (opers[i] == '-') result -= numbers[i + 1];
          }

          number = result;
          equation = result.toString();
        } else {
          number = 0;
          equation = "";
        }

        numbers.clear();
        opers.clear();
        equationTextFontSize = 40;

        return;
      }

      if (key == '+' || key == '-' || key == '/' || key == '*') {
        if (number == 0) return;

        if (opers.isNotEmpty && opers.last == '*') {
          numbers.last = numbers.last * number;
          opers.last = key;
        } else if (opers.isNotEmpty && opers.last == '/') {
          numbers.last = numbers.last / number;
          opers.last = key;
        } else {
          numbers.add(number);
          opers.add(key);
        }

        number = 0;
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
            alignment: Alignment.center,
            height: 150,
            child: Text(
              equation,
              style: TextStyle(
                  color: Colors.white, fontSize: equationTextFontSize),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(15),
              children: List.generate(
                calculatorButtons.length,
                (index) => CalculatorButton(
                  function: btnOnclick,
                  value: calculatorButtons[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
