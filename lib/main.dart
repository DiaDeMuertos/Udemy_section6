import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udemy course',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter & Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon icn = Icon(
    Icons.supervisor_account,
    color: Colors.red,
    size: 25,
  );

  void handlerOnPressed() {
    String hms = DateFormat.Hms().format(new DateTime.now()).toString();
    print('Pressed...$hms');
  }

  List<Widget> chipsBuilder() {
    List<Map<String, dynamic>> values = [
      {'id': 1, 'message': 'Hello'},
      {'id': 2, 'message': 'World'},
      {'id': 3, 'message': 'HMO'},
    ];

    return values.map((value) {
      return Chip(
        label: Text(value['message']),
        avatar: CircleAvatar(
          child: value['id'] % 2 == 0
              ? Icon(Icons.account_circle)
              : Text(value['id'].toString()),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: icn,
              onPressed: handlerOnPressed,
            ),
            ...chipsBuilder(),
          ],
        ),
      ),
    );
  }
}
