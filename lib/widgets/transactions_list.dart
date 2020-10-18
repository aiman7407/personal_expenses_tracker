import 'package:flutter/material.dart';
import 'package:personalexpenses/model/transactions.dart';
import 'package:intl/intl.dart';




class TransactionsList extends StatelessWidget {

  final List<Transactions>transactions ;
  final Function funDeleteTransaction;
  TransactionsList({@required this.transactions,this.funDeleteTransaction});




  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,

      child: transactions.isEmpty?

      Column(children: <Widget>[

      Text('No Transactions Added yet ! ',style: TextStyle(fontSize: 30),
      ),
      Flexible(child: Image.asset('assests/images/waiting.png',fit: BoxFit.cover,))

      ],
      )


          :   ListView.builder(

        itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(radius: 30, child: FittedBox(child:
            Text('${transactions[index].amount} ')),
            ),
            title: Text('${transactions[index].title}') ,
            subtitle: Text(DateFormat().add_yMMMMEEEEd().format(transactions[index].date)),
            trailing: IconButton(onPressed:()=>funDeleteTransaction(transactions[index].id)
                                 ,icon: Icon(Icons.delete_sweep),),
          );},

        itemCount: transactions.length,

        ),

    );
  }
}


//ListView(
//
//          children: transactions.map((transaction){
//            return Card(
//              margin: EdgeInsets.all(15),
//              child:Row(
//                children: <Widget>[
//                  Container(
//                    child: Text(
//                      '${transaction.amount} .LE',
//                      style:TextStyle(color: Colors.purple[600],fontSize: 20,fontWeight:FontWeight.bold ) ,
//                    ),
//
//                    margin:EdgeInsets.symmetric(vertical: 15,horizontal: 10),
//                    padding: EdgeInsets.all(10),
//                    decoration: BoxDecoration(
//                        border: Border.all(width:2,color: Colors.purple[600] )
//                    ),
//                  ),
//
//
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(transaction.title,style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
//                      Text(DateFormat().add_yMMMMEEEEd().format(transaction.date))
//                    ],)
//
//                ],
//              ),
//            );
//          }).toList(),
//
//        ),





