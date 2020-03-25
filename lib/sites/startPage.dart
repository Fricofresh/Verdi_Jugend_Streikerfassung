import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                """Herzlich willkommen zum Streiktag!
Nice, dass du am Start bist.
Bist du ver.di Mitglied?""",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Na logo!"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("Ne noch nicht."),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
