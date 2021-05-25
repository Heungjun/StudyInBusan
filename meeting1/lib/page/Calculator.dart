import 'package:flutter/material.dart';
import 'package:meeting1/style/styleCalculatorElevatedButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  EdgeInsets buttonPadding = EdgeInsets.all(5.0);
  int result = 0;
  String equation = "";
  double equationTextFontSize = 40;

  void btnOnclick(String key) {
    //TODO: validation check 기능
    //TODO: 계산 로직 구현
    setState(() {
      if (key == 'C') {
        equation = "";
        equationTextFontSize = 40;
      } else
        equation += key;

      if (equation.length >= 10) equationTextFontSize = 22;
    });

    print(equation.length);
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
