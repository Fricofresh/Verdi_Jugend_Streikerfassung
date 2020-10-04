import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class SalaryPromptPage extends StatefulWidget
{
  static const String routeId = "/salaryprompt";
  SalaryPromptPage({Key key}) : super(key: key);
  
  @override
  SalaryPromptPageState createState() => SalaryPromptPageState();
  
}

enum WidgetMarker { graph, azubifrage }

class SalaryPromptPageState extends State<SalaryPromptPage>
{
  int _rdgroupsalaryvalue = 0;
  int _rdgroupapprenticevalue = 0;
  bool _isrdcurrentsalaryenabled = true;
  bool _isrddunnoenabled = false;
  WidgetMarker selectedWidgetMarker = WidgetMarker.graph;
  
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
            child: getCustomContainer(),
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

  Widget getGraphWidget() {
     return new Row();
  }

  Widget getAzubiFrageWidget()
  {
     return new Row
        (
         children:
         [
            new Row(children:[new Text('Ich bin')]),
            new Row(children:
            [
              new Radio
              (
                  value: 0,
                  groupValue: _rdgroupapprenticevalue,
                  onChanged: null
              ),
              new Text('Azubi')
           ]),
            new Row(children: 
            [
               new Radio
               (
                  value: 1,
                  groupValue: _rdgroupapprenticevalue,
                  onChanged: null
               ),
               new Text('Beschäftigte*r')
            ])
         ]);
  }

  Widget getCustomContainer()
  {
     switch (selectedWidgetMarker)
     {
        case WidgetMarker.graph:
           {
               return getGraphWidget();
           }
        case WidgetMarker.azubifrage:
           {
           return MyStatelessWidget();
           }
     }
     return getGraphWidget();
  }
  
  void _handleswitchsalaryquestion(value)
  {
    setState(()
    {
      _rdgroupsalaryvalue = value;
      if(value == 1)
      {
        _isrdcurrentsalaryenabled = false;
        _isrddunnoenabled = true;
        selectedWidgetMarker = WidgetMarker.azubifrage;
      }
      else
      {
        _isrdcurrentsalaryenabled = true;
        _isrddunnoenabled = false;
        selectedWidgetMarker = WidgetMarker.graph;
      }
    });
  }
}

class MyStatelessWidget extends StatelessWidget
{
   @override
   Widget build(BuildContext context)
   {
      return new Row
      (
         children:
         [
            new Row(children: [new Text('This works')]),
            new Row(children: [new Text('This works')])
         ]
      );
   }
   
}