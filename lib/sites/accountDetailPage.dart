import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/newsletterPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class AccountDetailPage extends StatelessWidget {
  static const String routeId = "/accountDetail";
  @override
  Widget build(BuildContext context) {
    return BaseLayout(title: "Bitte gebe deine Kontodaten ein.", children: [
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: "IBAN"),
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: "BIC"),
      ),
      RaisedButton(
        child: Text("Bestätigen"),
        onPressed: () {
          //TODO validate input
          Navigator.pushNamed(context, NewsletterPage.routeId);
        },
      ),
    ]);
  }
}
