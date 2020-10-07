import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/util/SharedPreferencesExtension.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:verdi_jugend_streikerfassung/sites/TelegramChannelPage.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:verdi_jugend_streikerfassung/util/utils.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class PersonalDetailsPage extends StatelessWidget
{
  static const String routeId = "/personalDetails";
  bool _isMember;
  
  PersonalDetailsPage({Map<String, dynamic> args})
  {
      if (args != null && args.isNotEmpty)
      {
        this._isMember = args["isMember"];
      }
      if (this._isMember == null)
      {
       this._isMember = true;
      }
  }

  final TextEditingController _surnameTextController = TextEditingController();
  final TextEditingController _forenameTextController = TextEditingController();
  final TextEditingController _birthdayTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BaseLayout(title: "Bitte fülle die Felder aus", children:
    [
        new TextField
        (
            controller: _surnameTextController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Nachname"),
        ),
        new TextField
        (
          controller: _forenameTextController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Vorname"),
        ),
        _memberTextField(),
        RaisedButton
        (
          child: Text("weiter"),
          onPressed: () => buildPushNamed(context),
        ),
    ]);
  }

  TextField _memberTextField()
  {
      TextField result;

    if (_isMember)
    {
        result = TextField
        (
            controller: _birthdayTextController,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(hintText: "Geburtstag"),
        );
    }
    else
    {
        result = TextField
        (
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "E-Mail Adresse"),
        );
    }
    return result;
  }

  Future<Object> buildPushNamed(BuildContext context) async
  {
      var pref = UserModelProvider().getCurrentUser();
      // TODO fix
      // pref.addData({createKey(PersonalDetailsPage.routeId): this._isMember});
      return Navigator.pushNamed(context, TelegramChannelPage.routeId);
  }
}
