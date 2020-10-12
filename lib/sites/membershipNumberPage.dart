import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/lang/validationMessages.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';
import 'package:verdi_jugend_streikerfassung/sites/salaryPromptPage.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:intl/intl.dart';

class MembershipNumberPage extends StatefulWidget {
  static const String routeId = "/membershipNumber";
  MembershipNumberPage({Key key}) : super(key: key);

  @override
  MembershipNumberPageState createState() => MembershipNumberPageState();
}

class MembershipNumberPageState extends State<MembershipNumberPage> {
  TextEditingController _tecBirthday = new TextEditingController();
  TextEditingController _tecMembershipNumber = new TextEditingController();
  TextEditingController _tecName = new TextEditingController();
  TextEditingController _tecPreName = new TextEditingController();
  TextEditingController _tecCompany = new TextEditingController();
  TextEditingController _tecWeeklyHours = new TextEditingController();
  TextEditingController _tecStrikeTime = new TextEditingController();

  int _radiobuttonvalue = 0;
  bool _isrdmitgliedsnummerenabled = true;
  bool _isrdnomitgliedsnummerenabled = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: """Bitte trage hier deine Mitgliedsnummer ein.""",
      children: <Widget>[
        Text(
          "(Steht auf deinem Mitgliedsausweis oder im Betreff der Abbuchung in deiner Kontoumsatzanzeige)",
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radiobuttonvalue,
                    onChanged: (value) => _handleswitch(value),
                  ),
                  new Flexible(
                    fit: FlexFit.loose,
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      enabled: _isrdmitgliedsnummerenabled,
                      controller: _tecMembershipNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mitgliedsnummer',
                      ),
                      validator: (text) {
                        if (_isrdmitgliedsnummerenabled) {
                          if (text.isNotEmpty && BigInt.tryParse(text.replaceAll(RegExp(r"\s"), "")) != null) {
                            return null;
                          }
                          return MISSING_MEMBERSHIPNUMBER_MESSAGE;
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Radio(
                    value: 1,
                    groupValue: _radiobuttonvalue,
                    onChanged: (value) => _handleswitch(value),
                  ),
                  new Text('Habe ich grade nicht da :/')
                ],
              ),
              new TextFormField(
                enabled: _isrdnomitgliedsnummerenabled,
                controller: _tecName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (text) {
                  if (_isrdnomitgliedsnummerenabled && text.isEmpty) {
                    return MISSING_NAME_MESSAGE;
                  }
                  return null;
                },
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(),
                textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                enabled: _isrdnomitgliedsnummerenabled,
                controller: _tecPreName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Vorname',
                ),
                validator: (text) {
                  if (_isrdnomitgliedsnummerenabled && text.isEmpty) {
                    return MISSING_PRENAME_MESSAGE;
                  }
                  return null;
                },
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(),
                textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                controller: _tecBirthday,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Geburtsdatum',
                ),
                enabled: _isrdnomitgliedsnummerenabled,
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                  _tecBirthday.text = DateFormat("dd.MM.yyyy").format(date);
                },
                validator: (text) {
                  if (_isrdnomitgliedsnummerenabled && text.isEmpty) {
                    return MISSING_BITHDAY_MESSAGE;
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                controller: _tecCompany,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Betrieb / Dienststelle',
                ),
                validator: (text) {
                  if (text.isEmpty) {
                    return MISSING_TEXT_MESSAGE;
                  }
                  return null;
                },
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(),
                textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                controller: _tecWeeklyHours,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Wochenarbeitszeit in Stunden',
                ),
                validator: (text) {
                  if (text.isEmpty) {
                    return MISSING_TEXT_MESSAGE;
                  }
                  return null;
                },
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(),
                textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                controller: _tecStrikeTime,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Durch Streik ausgefallene Stunden (ohne Pausen)',
                ),
                validator: (text) {
                  if (text.isEmpty) {
                    return MISSING_TEXT_MESSAGE;
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
              new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("Weiter"),
                    onPressed: () => _handleContinue(),
                  ),
                  RaisedButton(child: Text("Zurück"), onPressed: () => Navigator.pop(context))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  void _handleswitch(value) {
    setState(
      () {
        _radiobuttonvalue = value;
        if (value == 1) {
          _isrdmitgliedsnummerenabled = false;
          _isrdnomitgliedsnummerenabled = true;
        } else {
          _isrdmitgliedsnummerenabled = true;
          _isrdnomitgliedsnummerenabled = false;
        }
      },
    );
  }

  void _handleContinue() {
    if (_formKey.currentState.validate()) {
      _fillUserData();
      Navigator.pushNamed(context, SalaryPromptPage.routeId);
    }
  }

  void _fillUserData() {
    UserModel user = new UserModelProvider().getCurrentUser();

    user.flgMember = true;
    user.strikeDetails.company = _tecCompany.text;
    user.strikeDetails.weeklyhours = double.parse(_tecWeeklyHours.text.replaceAll(",", "."));
    user.strikeDetails.striketime = double.parse(_tecStrikeTime.text.replaceAll(",", "."));

    if (_isrdmitgliedsnummerenabled) {
      user.flgMembershipNumber = true;
      user.membershipNumber = _tecMembershipNumber.text;
    } else {
      user.name = _tecName.text;
      user.prename = _tecPreName.text;
      user.birthday = _tecBirthday.text;
    }
  }
}
