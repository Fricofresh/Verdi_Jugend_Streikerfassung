import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/childBenefitPage.dart';
import 'package:verdi_jugend_streikerfassung/sites/generallSalaryDataPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class CurrentSalaryPage extends StatelessWidget {
  static const String routeId = "/currentSalary";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(title: "Aktuelles Bruttogehalt", children: [
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: "Brutogehalt"),
      ),
      RaisedButton(
          onPressed: () =>
              Navigator.pushNamed(context, ChildBenefitPage.routeId),
          child: Text("weiter")),
      RaisedButton(
        child: Text("Phu, ich weiß es nicht genau…"),
        onPressed: () =>
            Navigator.pushNamed(context, GenerallSalaryDataPage.routeId),
      )
    ]);
  }
}
