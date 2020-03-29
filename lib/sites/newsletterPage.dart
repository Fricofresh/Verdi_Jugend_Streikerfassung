import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/finishPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/notificationKontaktPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class NewsletterPage extends StatelessWidget {
  static const String routeId = "/newsletter";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Möchtest du über die Tarifrunde auf dem Laufenden bleiben und unseren TelegramNewsletter abonnieren?",
        children: [
          RaisedButton(
              child: Text("ja, coole Idee!"),
              onPressed: () => Navigator.pushNamed(
                  context, NotificationKontaktPage.routeId)),
          RaisedButton(
              child: Text("ne, lieber nicht"),
              onPressed: () => FinishPage.routeId)
        ]);
  }
}
