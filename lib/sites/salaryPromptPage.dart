import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class SalaryPromptPage extends StatefulWidget
{
  static const String routeId = "/salaryprompt";
  SalaryPromptPage({Key key}) : super(key: key);
  
  @override
  SalaryPromptPageState createState() => SalaryPromptPageState();
  
}

enum FirstWidgetMarker { empty, apprenticequestion }
enum SecondWidgetMarker {apprentice, employee}


class SalaryPromptPageState extends State<SalaryPromptPage>
{
  int _rdgroupsalaryvalue = 0;
  int _rdgroupapprenticevalue = 0;
  int _rdgroupchildallowance = 0;
  int _rdpartnerstriking = 9;
  bool _isrdcurrentsalaryenabled = true;
  bool _isrdchildallowanceenabled = true;
  
  FirstWidgetMarker selectedfirstWidgetMarker = FirstWidgetMarker.empty;
  SecondWidgetMarker selectedsecondWidgetMarker = SecondWidgetMarker.apprentice;
  
  @override
  Widget build(BuildContext context)
  {
    return BaseLayout
      (
       title: """Wie hoch ist dein monatliches Bruttogehalt?""",
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
               groupValue: _rdgroupsalaryvalue,
               onChanged: (value) => _handleswitchsalaryquestion(value),
             ),
             new Flexible
               (
                fit: FlexFit.loose,
                child:
                (
                   new TextField
                     (
                      enabled: _isrdcurrentsalaryenabled,
                      controller: new TextEditingController(),
                      decoration: InputDecoration
                        (
                           border: OutlineInputBorder(),
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
                groupValue: _rdgroupsalaryvalue,
                onChanged: (value) => _handleswitchsalaryquestion(value),
              ),
              new Text
                (
                 'Weiß ich nicht auswendig'
              )
            ]
         ),
         new Container
         (
            child: getFirstCustomContainer(),
         ),
         new Row(children: <Widget> [new Text('Hast du kindergeldberechtigte Kinder?')]),
         new Row
         (
            children:
            [
               new Radio(value: 0, groupValue: _rdgroupchildallowance, onChanged: (value) => _handleswitchchildallowance(value)),
               new Text('Ja'),
               new Expanded(child:
                  new TextField
                  (
                     enabled: _isrdchildallowanceenabled,
                     controller: new TextEditingController(),
                     decoration: InputDecoration
                     (
                        border: OutlineInputBorder(),
                        labelText: 'Wieviele?',
                     )
                  ))
            ]
         ),
         new Row
         (
            children:
            [
               new Radio(value: 1, groupValue: _rdgroupchildallowance, onChanged: (value) => _handleswitchchildallowance(value)),
               new Text('Nein')
            ]
         ),
          new Row(children: <Widget> [new Text('Hast du eine Partner*in '
             'der/die ebenfalls am heutigen Streik beteiligt ist?')]),
          new Row
             (
             children:
             [
                new Radio(value: 0, groupValue: _rdpartnerstriking, onChanged: (value) => _handleswitchpartnerstriking(value)),
                new Text('Ja')
             ]
          ),
          new Row
             (
             children:
             [
                new Radio(value: 1, groupValue: _rdpartnerstriking, onChanged: (value) => _handleswitchpartnerstriking(value)),
                new Text('Nein')
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
                  onPressed: () =>  Navigator.pushNamed(context, SalaryPromptPage.routeId)
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

  Widget getEmptyWidget() {
     return new Row();
  }

  Widget getApprenticeQuestionWidget()
  {
     return new Column
        (
         children:
         [
            new Text('Ich bin'),
            new Row
            (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                   new Radio
                   (
                      value: 0,
                      groupValue: _rdgroupapprenticevalue,
                      onChanged: (value) => _handleswitchapprenticequestion(value)
                   ),
                   new Text('Azubi')
                ]
            ),
            new Row
            (
               mainAxisAlignment: MainAxisAlignment.center,
               children:
               [
                  new Radio
                  (
                     value: 1,
                     groupValue: _rdgroupapprenticevalue,
                     onChanged: (value) => _handleswitchapprenticequestion(value)
                  ),
                  new Text('Beschäftigte*r'),
               ]
            ),
            new Row
            (
               mainAxisAlignment: MainAxisAlignment.center,
               children:
               [
                   new Container(child: getSecondCustomContainer())
               ]
            )
         ]);
  }

  Widget getFirstCustomContainer()
  {
     switch (selectedfirstWidgetMarker)
     {
        case FirstWidgetMarker.empty:
           {
               return getEmptyWidget();
           }
        case FirstWidgetMarker.apprenticequestion:
           {
           return getApprenticeQuestionWidget();
           }
     }
     return getEmptyWidget();
  }

  Widget getSecondCustomContainer()
  {
     switch (selectedsecondWidgetMarker)
     {
        case SecondWidgetMarker.apprentice:
           {
              return getApprenticeWidget();
           }
        case SecondWidgetMarker.employee:
           {
              return getEmployeeWidget();
           }
     }
     return getEmptyWidget();
  }
  
  void _handleswitchsalaryquestion(value)
  {
    setState(()
    {
      _rdgroupsalaryvalue = value;
      if(value == 1)
      {
        _isrdcurrentsalaryenabled = false;
        selectedfirstWidgetMarker = FirstWidgetMarker.apprenticequestion;
      }
      else
      {
        _isrdcurrentsalaryenabled = true;
        selectedfirstWidgetMarker = FirstWidgetMarker.empty;
      }
    });
  }

  void _handleswitchapprenticequestion(value)
  {
     setState(()
     {
        _rdgroupapprenticevalue = value;
        if(value == 1)
        {
           selectedsecondWidgetMarker = SecondWidgetMarker.employee;
        }
        else
        {
           selectedsecondWidgetMarker = SecondWidgetMarker.apprentice;
        }
     });
  }

  void _handleswitchchildallowance(value)
  {
     setState(()
     {
        _rdgroupchildallowance = value;
        if(value == 1)
        {
          _isrdchildallowanceenabled = false;
        }
        else
        {
           _isrdchildallowanceenabled = true;
        }
     });
  }

  void _handleswitchpartnerstriking(value)
  {
     setState(()
     {
        _rdpartnerstriking = value;
     });
  }

  Widget getApprenticeWidget() 
  {
     return new Expanded(child: new Column
     (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
         [
            new Row(
               children: <Widget>
               [
                  new Text('Azubi im '),
                  new Expanded(child: new TextField
                  (
                     controller: new TextEditingController(),
                     decoration: InputDecoration
                     (
                        border: OutlineInputBorder(),
                        labelText: '1, 2 oder 3',
                     )
                  )),
                  new Text(' Lehrjahr')
               ])
         ]
     ));
  }

  Widget getEmployeeWidget()
  {
     return new Expanded(child: new Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
           new Row(
              children: <Widget>
              [
                 new Text('Beschäftigte*r in der '),
                 new Expanded(child: new TextField
                    (
                    controller: new TextEditingController(),
                    decoration: InputDecoration
                       (
                       border: OutlineInputBorder(),
                       labelText: 'xten',
                    )
                 )),
                 new Text(' Entgeltgruppe')
              ])
        ]
     ));
  }
  
}
