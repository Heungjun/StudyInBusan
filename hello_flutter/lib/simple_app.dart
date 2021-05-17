import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless 위젯 데모')),
        body: _FirstStateFulWidget(),
      ),
    ));

class _FirstStateFulWidget extends StatefulWidget {
  @override
  State createState() => _FirstStateFulWidgetState();
}

class _FirstStateFulWidgetState extends State<_FirstStateFulWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('이것은 stateful 위젯입니다.');
  }
}

class _FirstStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('이것은 stateless 위젯입니다');
  }
}
