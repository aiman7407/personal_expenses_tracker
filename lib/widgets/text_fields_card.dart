import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldsCard extends StatefulWidget {

  final Function addTx;

  TextFieldsCard({this.addTx});

  @override
  _TextFieldsCardState createState() => _TextFieldsCardState();
}

class _TextFieldsCardState extends State<TextFieldsCard> {
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  DateTime selectedDate;
  void datePicker()
  {
    showDatePicker
      (context: context,
        initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()

    ).then((pickedDate){
     if(pickedDate==null)
       return;
     else
       setState(() {
         selectedDate=pickedDate;
       });

    });
  }

  void submitData()
  {

    final title=titleController.text;
    final amount= double.parse(amountController.text);
    if(title.isEmpty||amount<=0||selectedDate.toString()==null)
      return;

    widget.addTx(title,amount,selectedDate);
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(

        color: Colors.yellow[50],
        margin: EdgeInsets.all(20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title'
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
              keyboardType: TextInputType.number ,
              onSubmitted: (_)=> submitData,
            ),

            Row(children: <Widget>[
              Text(selectedDate==null
                  ?'No Date Chosen'
                  :DateFormat.Md().format(selectedDate)),


              FlatButton(child: Text('Add date'),onPressed:datePicker )
            ],),

            FlatButton(
              child: Text('Add Transaction',style: TextStyle(color: Colors.purple[600]),),
              onPressed: (){

                   submitData();
              },

            )
          ],
        ) ,
      );
  }
}
