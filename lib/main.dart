import 'package:flutter/material.dart';
import 'sites/startPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String _title = "ver.di Streikerfassung";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$_title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(title: ""),
    );
  }
}
