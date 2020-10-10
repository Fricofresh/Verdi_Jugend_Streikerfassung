import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';
import 'package:verdi_jugend_streikerfassung/sites/salaryPromptPage.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';

class MembershipNumberPage extends StatefulWidget
{
  static const String routeId = "/membershipNumber";
  MembershipNumberPage({Key key}) : super(key: key);
  
  @override
  MembershipNumberPageState createState() => MembershipNumberPageState();
  
}

class MembershipNumberPageState extends State<MembershipNumberPage>
{
  
  TextEditingController _tecBirthday = new TextEditingController();
  TextEditingController _tecMembershipNumber = new TextEditingController();
  TextEditingController _tecName = new TextEditingController();
  TextEditingController _tecPreName = new TextEditingController();
  TextEditingController _tecCompany = new TextEditingController();
  TextEditingController _tecWeeklyHours = new TextEditingController();
  TextEditingController _tecStrikeTime = new TextEditingController();
  
  int _radiobuttonvalue = 1;
  bool _isrdmitgliedsnummerenabled = true;
  bool _isrdnomitgliedsnummerenabled = false;
  
  @override
  Widget build(BuildContext context)
  {
    return BaseLayout
      (
       title: """Bitte trage hier deine Mitgliedsnummer ein.
           (Steht auf deinem Mitgliedsausweis oder
       im Betreff der Abbuchung in deiner Kontoumsatzanzeige)""",
       children: <Widget>
       [
         new Row
           (
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>
           [
             new Radio
               (
               value: 0,
               groupValue: _radiobuttonvalue,
               onChanged: (value) => _handleswitch(value),
             ),
             new Flexible
               (
                fit: FlexFit.loose,
                child:
                (
                   new TextField
                     (
                      keyboardType: TextInputType.number,
                      enabled: _isrdmitgliedsnummerenabled,
                      controller: _tecMembershipNumber,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder(),
                        labelText: 'Mitgliedsnummer',
                      )
                   )
                )
             )
           ],
         ),
         new Row
           (
            children: <Widget>
            [
              new Radio
                (
                value: 1,
                groupValue: _radiobuttonvalue,
                onChanged: (value) => _handleswitch(value),
              ),
              new Text
                (
                 'Habe ich grade nicht da :/'
              )
            ]
         ),
         new Row
           (
            children: <Widget>
            [
              new Flexible
                (
                 child: new TextField
                   (
                    enabled: _isrdnomitgliedsnummerenabled,
                    controller: _tecName,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    )
                 )
              )
            ]
         ),
         new Row
           (
            children: <Widget>
            [
              new Flexible
                (
                 child: new TextField
                   (
                    enabled: _isrdnomitgliedsnummerenabled,
                    controller: _tecPreName,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'Vorname',
                    )
                 )
              )
            ]
         ),
         new Row
           (
            children: <Widget>
            [
              new Flexible
                (
                 child: new TextFormField
                   (
                    controller: _tecBirthday,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'Geburtsdatum',
                    ),
                    enabled: _isrdnomitgliedsnummerenabled,
                    onTap: () async
                    {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());
                      
                      date = await showDatePicker
                        (
                         context: context,
                         initialDate:DateTime.now(),
                         firstDate:DateTime(1900),
                         lastDate: DateTime(2100)
                      );
                      _tecBirthday.text = date.toIso8601String(); // TODO: Nullpointerexception wenn kein Datum ausgewäht wird
                    }
                 )
              )
            ]
         ),
         new Row
            (
            children: <Widget>
            [
               new Flexible
                  (
                  child: new TextField
                     (
                     controller: _tecCompany,
                     decoration: InputDecoration
                     (
                        border: OutlineInputBorder(),
                        labelText: 'Betrieb / Dienststelle',
                     )
                  )
               )
            ]
         ),
          new Row
             (
             children: <Widget>
             [
                new Flexible
                   (
                   child: new TextField
                      (
                      controller: _tecWeeklyHours,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration
                         (
                         border: OutlineInputBorder(),
                         labelText: 'Wochenarbeitzszeit in Stunden',
                      )
                   )
                )
             ]
          ),
          new Row
             (
             children: <Widget>
             [
                new Flexible
                   (
                   child: new TextField
                      (
                      controller: _tecStrikeTime,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration
                         (
                         border: OutlineInputBorder(),
                         labelText: 'Durch Streik ausgefallene Stunden (ohne '
                            'Pausen!',
                      )
                   )
                )
             ]
          ),
         new ButtonBar
           (
            alignment: MainAxisAlignment.center,
            children: <Widget>
            [
               RaisedButton
               (
                  color: Colors.blue,
                  child: Text("Weiter"),
                  onPressed: () => _handleContinue(),
               ),
               RaisedButton
               (
               child: Text("Zurück"),
               onPressed: () =>  Navigator.pop(context)
               )
            ]
          )
     ]
    );
  }
  
  void _handleswitch(value)
  {
    setState(()
    {
      _radiobuttonvalue = value;
      if(value == 1)
      {
        _isrdmitgliedsnummerenabled = false;
        _isrdnomitgliedsnummerenabled = true;
      }
      else
      {
        _isrdmitgliedsnummerenabled = true;
        _isrdnomitgliedsnummerenabled = false;
      }
    });
  }
  
  void _handleContinue()
  {
     _fillUserData();
     Navigator.pushNamed(context, SalaryPromptPage.routeId);
  }
  
  void _fillUserData()
  {
     UserModel user = new UserModelProvider().getCurrentUser();
     
     user.flgMember = true;
     user.strikeDetails.company = _tecCompany.text;
     user.strikeDetails.weeklyhours = double.parse(_tecWeeklyHours.text);
     user.strikeDetails.striketime = double.parse(_tecStrikeTime.text);
     
     if(_isrdmitgliedsnummerenabled)
     {
         user.flgMembershipNumber = true;
         user.membershipNumber = _tecMembershipNumber.text;
     }
     else
     {
         user.name = _tecName.text;
         user.prename = _tecPreName.text;
         user.birthday = _tecBirthday.text;
     }
     
     
  }
}

