import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/lostWorkingHoursPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class WorkingHoursPage extends StatelessWidget {
  static const String routeId = "/workingHours";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Wie ist deine arbeitsvertragliche Wochenarbeitszeit in Stunden?",
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Stundenanzahl"),
          ),
          RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, LostWorkingHoursPage.routeId),
              child: Text("weiter")),
        ]);
  }
}
