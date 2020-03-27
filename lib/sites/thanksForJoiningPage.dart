import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/personalDetailsPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class ThanksForJoiningPage extends StatelessWidget {
  static const String routeId = "/thanksForJoining";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Schön, dass du jetzt Mitglied bist. Du erhältst für den heutigen Tag bereits Streikgeld von uns. Fülle dafür bitte das folgende Formular bist zum Ende aus",
        children: [
          RaisedButton(
              child: Text("weiter"),
              onPressed: () =>
                  Navigator.pushNamed(context, PersonalDetailsPage.routeId)),
        ]);
  }
}
