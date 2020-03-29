import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/coPartnerPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/strikePayPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class ChildBenefitPage extends StatelessWidget {
  static const String routeId = "/childBenefit";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "Hast du kindergeldberechtigte Kinder?",
        children: [
          ButtonBar(
            children: <Widget>[
              DropdownButton(
                items: <DropdownMenuItem<dynamic>>[
                  DropdownMenuItem(child: Text("ja")),
                  DropdownMenuItem(child: Text("nein"))
                ],
                onChanged: (value) {
                  //TODO Show TextField
                },
              ),
              RaisedButton(onPressed: () {
                //TODO validate TextField
                Navigator.pushNamed(context, CoPartnerPage.routeId);
              }),
            ],
          )
        ]);
  }
}
