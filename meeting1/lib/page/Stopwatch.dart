import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              '00:00:00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            alignment: Alignment.center,
            height: 450,
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              '시작',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          )
        ],
      ),
    );
  }
}
