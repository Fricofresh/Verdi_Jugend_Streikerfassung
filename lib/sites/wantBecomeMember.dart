import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verdi_jugend_streikerfassung/sites/becomeMemberPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/notificationKontaktPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/personalDetailsPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class WantBecomeMemberPage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  static const String routeId = "/wantBecomeMember";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title:
          """Wie erfolgreich wir in der Tarifrunde sind, hängt davon ab, wie viele Menschen sich in ver.di organisieren und hinter den Forderungen stehen.

Möchtest du ver.di Mitglied werden?
""",
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.blue,
              child: Text("Ja, gern!"),
              onPressed: () => handleOnPressed(
                  true, Navigator.pushNamed(context, BecomeMemberPage.routeId)),
            ),
            FlatButton(
              child: Text(
                  "Nein, das Ergebnis der Tarifrunde ist mir nicht so wichtig."),
              onPressed: () => handleOnPressed(
                  false,
                  Navigator.pushNamed(context, PersonalDetailsPage.routeId,
                      arguments: {"isMember": false})),
            ),
          ],
        ),
      ],
    );
  }

  Future<Object> handleOnPressed(
      bool mitgliedWerden, Future<Object> onPressFunction) async {
    return onPressFunction;
  }
}
