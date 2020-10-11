
import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:verdi_jugend_streikerfassung/sites/membershipNumberPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class WelcomePage extends StatefulWidget
{
  static const String routeId = "/";
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
{
  @override
  Widget build(BuildContext context)
  {
    resetData();
    return BaseLayout
      (
        title: """Herzlich willkommen zum Streiktag!
          Nice, dass du am Start bist.
          Bist du ver.di Mitglied?""",
      children:
      [
        ButtonBar
        (
          alignment: MainAxisAlignment.center,
          children: <Widget>
          [
            RaisedButton
            (
              color: Colors.blue,
              child: Text("Na logo!"),
              onPressed: () => Navigator.pushNamed(context, MembershipNumberPage.routeId),
            ),
            /*RaisedButton
            (
                child: Text("Ne noch nicht."),
                onPressed: () => Navigator.pushNamed(context, WantBecomeMemberPage.routeId),
            ),*/
          ],
        ),
      ],
    );
  }

  void resetData() async
  {
    final UserModelProvider pref = UserModelProvider();
    pref.resetCurrentUser();
  }
}
