import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/workingHoursPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class CompanyPage extends StatelessWidget {
  static const String routeId = "/company";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "In welchem Betrieb/welcher Dienststelle arbeitest du?",
      children: [
        //TODO add Items
        DropdownButton(items: null, onChanged: null),
        RaisedButton(
          child: Text("weiter"),
          onPressed: () =>
              Navigator.pushNamed(context, WorkingHoursPage.routeId),
        ),
      ],
    );
  }
}
