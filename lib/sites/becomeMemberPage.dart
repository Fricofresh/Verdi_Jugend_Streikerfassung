import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/thanksForJoiningPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class BecomeMemberPage extends StatelessWidget {
  static const String routeId = "/becomeMember";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Mitgliederwerden",
      children: <Widget>[
        RaisedButton(
            child: Text("weiter"),
            onPressed: () =>
                Navigator.pushNamed(context, ThanksForJoiningPage.routeId)),
      ],
    );
  }
}
