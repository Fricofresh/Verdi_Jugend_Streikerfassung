import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/model/userModel.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';
import 'package:verdi_jugend_streikerfassung/sites/TelegramChannelPage.dart';

class TransferArrangementsPage extends StatefulWidget
{
  static const String routeId = "/transferarrangements";
  TransferArrangementsPage({Key key}) : super(key: key);
  
  @override
  TransferArrangementsState createState() => TransferArrangementsState();
  
}

enum WidgetMarker {empty, manuell}

class TransferArrangementsState extends State<TransferArrangementsPage>
{
   
   int _rdgroupaccountchooser = 0;
   TextEditingController _teciban = new TextEditingController();
   TextEditingController _tecbic = new TextEditingController();
   WidgetMarker selectedWidgetMarker = WidgetMarker.manuell;
  
  @override
  Widget build(BuildContext context)
  {
    return BaseLayout
      (
         title: "Wohin sollen wir dein Streikgeld überweisen?",
         children: <Widget>
         [
           new Row(
              children:
              [
                 new Radio(value: 0, groupValue: _rdgroupaccountchooser, onChanged: (value) => _handleaccountchooserwitch(value)),
                 new Text('auf folgendes Konto')
              ]),
            new Row(
               children: 
               [
                  new Radio(value: 1, groupValue: _rdgroupaccountchooser, onChanged: (value) => _handleaccountchooserwitch(value)),
                  new Text('Auf das Konto, von dem mein Mitgliedsbeitrag abgebucht wird')
               ]),
            new Container(child: getCustomContainer()),
            new ButtonBar
               (
               alignment: MainAxisAlignment.center,
               children: <Widget>
               [
                  RaisedButton
                     (
                     color: Colors.blue,
                     child: Text("Weiter"),
                     onPressed: () => _handleContinue()),
                  
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

  Widget getCustomContainer()
  {
     switch (selectedWidgetMarker)
     {
        case WidgetMarker.empty:
           {
               return getEmptyWidget();
           }
        case WidgetMarker.manuell:
           {
           return getAccountDetailsWidget();
           }
     }
     return getEmptyWidget();
  }
  
  Widget getEmptyWidget() {return new Row();}
  
  Widget getAccountDetailsWidget()
  {
     return new Column( children:
            [
               new Row(children:
               [
                     new Text('  IBAN:'),
                     new Flexible(child:
                        new TextField
                           (
                              controller: _teciban,
                              decoration: InputDecoration
                              (
                                 border: OutlineInputBorder(),
                                 labelText: 'XXXX XXXX XXXX XXXX XXXX XX',
                              )
                           ))
               ]),
               new Row(children:
               [
                     new Text('  BIC:   '),
                  new Flexible(child:
                  new TextField
                     (
                     controller: _tecbic,
                     decoration: InputDecoration
                        (
                        border: OutlineInputBorder(),
                        labelText: 'XXXX XX XX XXX',
                     )
                  ))
               ]),
            ]);
  }
  
  void _handleaccountchooserwitch(value)
  {
    setState(()
    {
      _rdgroupaccountchooser = value;
      if(value == 1)
      {
        selectedWidgetMarker = WidgetMarker.empty;
      }
      else
      {
        selectedWidgetMarker = WidgetMarker.manuell;
      }
    });
  }

  void _showAlertDialog()
  {
     showDialog(
        context: context,
        builder: (BuildContext context){
           return AlertDialog
           (
              title: Text('Achtung!'),
              content: Text('Diese Aktion kann nur gewählt werden, wenn der '
                 'Mitgliedsbeitrag per Lastschrift abgebucht wird. Wenn der '
                 'Mitgliedsbeitrag per Überweisung oder Lohnabzug gezahlt '
                 'wird, dann gib bitte deine Kontodaten an'),
              actions:
              [
                 new FlatButton(child: Text('Weiter'), onPressed: () => _handleContinueAlert()),
                 new FlatButton(child: Text('Abbrechen'), onPressed: () => _handleCancelAlert())
              ],
           );
        },
     );
  }
  
  void _handleContinue()
  {
     _fillUserData();
     if(_rdgroupaccountchooser == 0)
      {
         _sendData();
         Navigator.pushNamed(context, TelegramChannelPage.routeId);
      }
     else
     {
         _showAlertDialog();
     }
  }
  
  void _handleCancelAlert()
  {
     _handleaccountchooserwitch(0);
     Navigator.of(context).pop();
  }
  void _handleContinueAlert()
  {
     Navigator.of(context).pop();
     _sendData();
     Navigator.pushNamed(context, TelegramChannelPage.routeId);
  }
  
  void _fillUserData()
  {
     UserModel user = new UserModelProvider().getCurrentUser();
     if(_rdgroupaccountchooser == 0)
     {
        user.flgStandardAccount = false;
        user.iban = _teciban.text;
        user.bic = _tecbic.text;
     }
     else user.flgStandardAccount = true;
  }
  
  void _sendData() async
  {
      Future future = new UserModelProvider().saveAndResetCurrentUser();
      await future.then((value) => _showNotification(true)).whenComplete(() => _showNotification(false));
  }
  
  void _showNotification(bool successful)
  {
  
  }
}

