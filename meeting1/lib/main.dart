import 'package:flutter/material.dart';
import 'page/Calculator.dart';
import 'page/Stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meeting #1'),
        ),
        body: TabBarView(
          children: [
            Calculator(),
            Text(
              '시간',
              style: TextStyle(color: Colors.white),
            ),
            Stopwatch(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: '계산기'),
            Tab(text: '시간'),
            Tab(text: '스톱워치'),
          ],
          indicatorColor: Colors.purple,
          labelColor: Colors.purpleAccent,
          unselectedLabelColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(vertical: 30.0),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
