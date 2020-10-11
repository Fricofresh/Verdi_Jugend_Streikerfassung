import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:verdi_jugend_streikerfassung/services/sendMessageProxy.dart';
import 'package:verdi_jugend_streikerfassung/sites/welcomePage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class TelegramChannelPage extends StatelessWidget {
  static const String routeId = "/telegramChannel";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Such auf Telegram den @VERDIJugendtarifkampagneBot und schick"
          " ihm eine Nachricht mit /start Schon bist du dabei!",
      children: [
        RaisedButton(
          child: Text("Weiter"),
          onPressed: () => buildPushNamed(context),
        ),
      ],
    );
  }

  Future<Object> buildPushNamed(BuildContext context) async {
    var isSend = await SendMessageProxy().sendData();
    if (!isSend) {
      print("Fehler Daten konnte nicht gesendet werden.");
    }
    return Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomePage.routeId,
      (_) => false,
    );
  }
}
