import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/childBenefitPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class GenerallSalaryDataPage extends StatelessWidget {
  static const String routeId = "/generallSalaryData";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Wie bist du eingestellt?",
      children: <Widget>[
        //TODO add items see
        DropdownButton(
          items: null,
          onChanged: (value) {},
        ),
        RaisedButton(
            child: Text("weiter"),
            onPressed: () =>
                Navigator.pushNamed(context, ChildBenefitPage.routeId)),
      ],
    );
  }

  //TODO AzubiView
  azubiView() {}
  //TODO EmployeeView
  employeeView() {}
}
