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
   DateTime selectedDate = DateTime.now();
   TextEditingController _ted;
   int _radiobuttonvalue = 1;
   bool _isrdmitgliedsnummerenabled = true;
   bool _isrdnomitgliedsnummerenabled = false;
   
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
				 	enabled: _isrdnomitgliedsnummerenabled,
				 	onTap: () => _selectDate(context),
				 	
				 	controller: _ted = new TextEditingController(),
				 	decoration: InputDecoration
				    (
				    	border: OutlineInputBorder(),
				    	labelText: 'Geburtsdatum',
				 	)
			   )
			)
		  ]
	    )
	 ],
    );
  }

   Future<Null> _selectDate(BuildContext context) async
   {
	 final DateTime picked = await showDatePicker
	    (
	    	context: context,
	    	initialDate: selectedDate,
	    	firstDate: DateTime(2015, 8),
	    	lastDate: DateTime(2101));
	 if (picked != null && picked != selectedDate)
	    setState(()
	    {
		  selectedDate = picked;
		  _ted.text = selectedDate.toIso8601String(); // async!
	    });
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
