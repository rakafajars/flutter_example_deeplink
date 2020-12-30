import 'package:flutter/material.dart';

class TestScreenPage extends StatefulWidget {
  final String id;

  const TestScreenPage({Key key, this.id}) : super(key: key);
  @override
  _TestScreenPageState createState() => _TestScreenPageState();
}

class _TestScreenPageState extends State<TestScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raka'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
