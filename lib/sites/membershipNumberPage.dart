import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';
import 'package:verdi_jugend_streikerfassung/sites/salaryPromptPage.dart';

class MembershipNumberPage extends StatefulWidget
{
  static const String routeId = "/membershipNumber";
  MembershipNumberPage({Key key}) : super(key: key);
  
  @override
  MembershipNumberPageState createState() => MembershipNumberPageState();
  
}

class MembershipNumberPageState extends State<MembershipNumberPage>
{
  DateTime selectedDate = DateTime.now();
  TextEditingController _ted = new TextEditingController();
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
                      enabled: _isrdmitgliedsnummerenabled,
                      controller: new TextEditingController(),
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
                    controller: new TextEditingController(),
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
                    controller: new TextEditingController(),
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
                    controller: _ted,
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
                      _ted.text = date.toIso8601String(); // Nullpointerexception wenn kein Datum ausgewähöt wird
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
                     controller: new TextEditingController(),
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
                      controller: new TextEditingController(),
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
                      controller: new TextEditingController(),
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
                  onPressed: () =>  Navigator.pushNamed(context, SalaryPromptPage.routeId),
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
}

