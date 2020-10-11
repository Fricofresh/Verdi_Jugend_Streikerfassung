import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:verdi_jugend_streikerfassung/main.dart';

class BaseLayout extends StatelessWidget {
  final String title;

  final List<Widget> children;

  dynamic parentChildren;

  BaseLayout({@required this.title, @required this.children});

  @override
  Widget build(BuildContext context) {
    children.map((e) => e);
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 20.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
          ]..addAll(children),
        ),
      ),
    );
  }
}
