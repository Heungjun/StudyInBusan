import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meeting1/widget/calculatorButton.dart';
import 'package:meeting1/common.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  double equationTextFontSize = 40;

  List<Pair<num, String>> numbersNOperators = [];
  List<String> numbersNOperatorsHistory = [];
  num number = 0;
  bool isPreButtonNumber = false; // 초기 function button 입력 방지

  String lastKey = '';

  void errorMessage(String text) => Fluttertoast.showToast(msg: text);

  // number button click
  void numberButtonClick() {
    isPreButtonNumber = true;
    number = number * 10 + int.parse(lastKey);
  }
  // number button click />

  // function button click
  void functionButtonClick() {
    if (!isPreButtonNumber) {
      if (numbersNOperators.length > 0) {
        numbersNOperators.last.second = lastKey;
        numbersNOperatorsHistory.last = lastKey;
        print('in');
      }
      print('out');
      return;
    }

    isPreButtonNumber = false;
    switch (lastKey) {
      case 'C':
        clear();
        break;
      case '=':
        result();
        break;
      default:
        operatorClick();
    }
  }
  // function button click />

  // function 'C'
  void clear([number = 0]) {
    this.number = number;
    numbersNOperators.clear();
    numbersNOperatorsHistory.clear();
    equationTextFontSize = 40;
    isPreButtonNumber = true;
  }
  // 'C' />

  void result() {
    if (numbersNOperators.isEmpty) return;

    Pair<num, String> lastPair = numbersNOperators.last;

    if (lastPair.second == '*') {
      number = lastPair.first * number;
      numbersNOperators.removeLast();
    } else if (lastPair.second == '/') {
      if (number == 0) {
        errorMessage('0으로 나눌 수 없습니다.');
        return;
      }
      number = lastPair.first / number;
      numbersNOperators.removeLast();
    }

    num result = number;
    num currentNumber = 0;
    String currentOperator = '';
    for (int i = 0, loopCnt = numbersNOperators.length; i < loopCnt; i++) {
      currentNumber = numbersNOperators[i].first;
      currentOperator = numbersNOperators[i].second;

      if (currentOperator == '+')
        result += currentNumber;
      else if (currentOperator == '-')
        result -= currentNumber;
      else
        errorMessage('오류 발생: $currentOperator');
    }

    clear(result);
  }

  void operatorClick() {
    if (numbersNOperators.isEmpty)
      numbersNOperators.add(Pair(number, lastKey));
    else {
      Pair<num, String> lastPair = numbersNOperators.last;

      if (lastPair.second == '*') {
        numbersNOperators.last.first = lastPair.first * number;
        numbersNOperators.last.second = lastKey;
      } else if (lastPair.second == '/') {
        if (number == 0) {
          errorMessage('0으로 나눌 수 없습니다.');
          return;
        }
        numbersNOperators.last.first = lastPair.first / number;
        numbersNOperators.last.second = lastPair.second;
      } else {
        numbersNOperators.add(Pair(number, lastKey));
      }
    }

    numbersNOperatorsHistory.add('$number');
    numbersNOperatorsHistory.add(lastKey);
    number = 0;
  }

  void outputEquation() {
    equation = '';
    numbersNOperatorsHistory.forEach((element) => equation += ' $element');
    equation += number.toString();
  }

  void btnOnclick(String key) {
    setState(() {
      lastKey = key;
      int.tryParse(lastKey) == null
          ? functionButtonClick()
          : numberButtonClick();

      outputEquation();
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

final List<String> calculatorButtons = [
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
