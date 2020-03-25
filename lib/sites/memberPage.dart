import 'package:flutter/material.dart';

class memberPage extends StatefulWidget {
  Widget currendWidget;

  @override
  _memberPageState createState() => _memberPageState();
}

class _memberPageState extends State<memberPage> {
  @override
  memberPage get currendWidget => super.widget.currendWidget;

  @override
  Widget build(BuildContext context) {
    return currendWidget;
  }
}
