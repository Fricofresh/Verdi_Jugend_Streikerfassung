import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';

class MembershipNumberPage extends StatefulWidget
{
  static const String routeId = "/membershipNumber";
  MembershipNumberPage({Key key}) : super(key: key);

  @override
  MembershipNumberPageState createState() => MembershipNumberPageState();
  
}

class MembershipNumberPageState extends State<MembershipNumberPage>
{
  
   int _radiobuttonvalue = 1;
   
  @override
  Widget build(BuildContext context)
  {
    //TODO add embetted webview, listen to form submit and go futher
    return BaseLayout
      (
        title:
        """Bitte trage hier deine Mitgliedsnummer ein.
           Steht auf deinem Mitgliedsausweis oder
       im Betreff der Abbuchung in deiner Kontoumsatzanzeige""",
      children:
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
			  child:
			  (
			  	new TextField
				(
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
		  ]
		)
	 ],
    );
  }

  void _handleswitch(value)
  {
	setState(()
	 {
	    _radiobuttonvalue = value;
	 });
  }
}
