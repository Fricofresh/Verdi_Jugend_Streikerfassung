import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/finishPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class NotificationKontaktPage extends StatelessWidget {
  static const String routeId = "/notificationKontakt";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Such auf Telegram den @VERDIJugendtarifkampagneBot und schick ihm eine Nachricht mit /start Schon bist du dabei!",
        children: [
          RaisedButton(
              child: Text("Weiter"),
              onPressed: () => Navigator.pushNamed(context, FinishPage.routeId))
        ]);
  }
}
