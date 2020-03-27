import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/companyPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class PersonalDetailsPage extends StatelessWidget {
  static const String routeId = "/personalDetails";

  var surnameTextController = TextEditingController();
  var forenameTextController = TextEditingController();
  var birthdayTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(title: "Bitte fülle die Felder aus", children: [
      TextField(
        controller: surnameTextController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: "Nachname"),
      ),
      TextField(
        controller: forenameTextController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: "Vorname"),
      ),
      TextField(
        controller: forenameTextController,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(hintText: "Geburtstag"),
      ),
      RaisedButton(
        child: Text("weiter"),
        onPressed: () => Navigator.pushNamed(context, CompanyPage.routeId),
      ),
    ]);
  }
}
