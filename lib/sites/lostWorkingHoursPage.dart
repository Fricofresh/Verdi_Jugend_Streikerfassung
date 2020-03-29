import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/generallSalaryDataPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class LostWorkingHoursPage extends StatelessWidget {
  static const String routeId = "/lostWorkingHours";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title:
            "Durch Arbeitskampf ausgefallene Arbeitszeit in Stunden (ohne Pause!)",
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Stundenanzahl"),
          ),
          RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, GenerallSalaryDataPage.routeId),
              child: Text("weiter")),
        ]);
  }
}
