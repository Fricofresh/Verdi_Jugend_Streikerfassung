import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/strikePayPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class CoPartnerPage extends StatelessWidget {
  static const String routeId = "/coPartner";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Hast du eine*n Partner*in, der/die am Streik beteiligt ist und ebenfalls Streikgeld bezieht?",
        children: [
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                  child: Text("ja"),
                  onPressed: () {
                    //TODO Save choice
                    Navigator.pushNamed(context, StrikePayPage.routeId);
                  }),
              RaisedButton(
                  child: Text("nein"),
                  onPressed: () {
                    //TODO Save choice
                    Navigator.pushNamed(context, StrikePayPage.routeId);
                  }),
            ],
          )
        ]);
  }
}
