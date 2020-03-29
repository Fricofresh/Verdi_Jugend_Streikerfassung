import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/accountDetailPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/newsletterPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class StrikePayPage extends StatelessWidget {
  static const String routeId = "/strikePay";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Wohin sollen wir dein Streikgeld überweisen?",
        children: [
          RaisedButton(
              child: Text(
                  "Auf das Bankkonto, von dem mein Mitgliedsbeitrag eingezogen wird."),
              onPressed: () {
                //TODO show warning
                Navigator.pushNamed(context, NewsletterPage.routeId);
              }),
          RaisedButton(
              child: Text("Ich will lieber meine Kontodaten manuell eingeben."),
              onPressed: () =>
                  Navigator.pushNamed(context, AccountDetailPage.routeId))
        ]);
  }
}
