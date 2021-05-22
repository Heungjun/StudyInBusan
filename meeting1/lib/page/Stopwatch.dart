import 'dart:async';

import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  List<String> _listStopwatchState = ['Stop', 'Run', 'Pause'];
  String _strStateStopwatch = 'stop';
  int _time = 0;
  late Timer _timer;
  List<String> _saveTimes = [];

  Widget stateBtns(String _stopwatchTimer) {
    Widget stateBtns = ElevatedButton(
      onPressed: () {
        _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
          setState(() {
            _time++;
          });
        });
        setState(() {
          _strStateStopwatch = _listStopwatchState[1];
        });
      },
      child: Text(
        '시작',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );

    if (_strStateStopwatch == _listStopwatchState[1]) {
      stateBtns = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_timer.isActive) _timer.cancel();
              setState(() {
                _strStateStopwatch = _listStopwatchState[2];
              });
            },
            child: Text(
              '중지',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _saveTimes.insert(0, _stopwatchTimer);
              });
            },
            child: Text(
              '구간기록',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          )
        ],
      );
    } else if (_strStateStopwatch == _listStopwatchState[2]) {
      stateBtns = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
                setState(() {
                  _time++;
                });
              });
              setState(() {
                _strStateStopwatch = _listStopwatchState[1];
              });
            },
            child: Text(
              '계속',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
          ElevatedButton(
            onPressed: () {
              //TODO 구간기록 초기화 기능 추가.
              if (_timer.isActive) _timer.cancel();
              _time = 0;
              setState(() {
                _strStateStopwatch = _listStopwatchState[0];
              });
            },
            child: Text(
              '초기화',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          )
        ],
      );
    }

    return stateBtns;
  }

  @override
  Widget build(BuildContext context) {
    int _stopwatchTimerHour = _time ~/ 360000;
    int _stopwatchTimerMinute = ((_time ~/ 100) ~/ 60) % 60;
    int _stopwatchTimerSecond = (_time ~/ 100) % 60;
    int _stopwatchTimerMilli = _time % 100;
    String _stopwatchTimer =
        '${_stopwatchTimerHour == 0 ? '' : _stopwatchTimerHour.toString() + ':'}${_stopwatchTimerMinute.toString().padLeft(2, '0')}:${_stopwatchTimerSecond.toString().padLeft(2, '0')}.${_stopwatchTimerMilli.toString().padLeft(2, '0')}';

    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _stopwatchTimer,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                _saveTimes.length > 0
                    ? ListView(
                        children: _saveTimes
                            .map((time) => Text(
                                  time,
                                  style: TextStyle(color: Colors.white),
                                ))
                            .toList(),
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
            alignment: Alignment.center,
            height: 450,
          ),
          SizedBox(height: 100),
          stateBtns(_stopwatchTimer),
        ],
      ),
    );
  }
}
