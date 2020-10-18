import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personalexpenses/widgets/chart.dart';
import 'package:personalexpenses/widgets/text_fields_card.dart';
import 'package:personalexpenses/widgets/transactions_list.dart';
import 'model/transactions.dart';


void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage() ,
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final List<Transactions> _finalTransactionsList=[
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
//    Transactions(date: DateTime.now(),amount:50,title: 'funal',id:'t1' ),
  ];


  List<Transactions> get _recentTransactionList
  {
    return _finalTransactionsList.where((trans){
      return trans.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }



  void addTransaction(String txTitle,double txAmount,DateTime chosenDate)
  {
    final tx=Transactions(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: chosenDate
    );

    setState(() {
      _finalTransactionsList.add(tx);
    });

  }


  void deleteTransaction(String id)
  {
    setState(() {
      _finalTransactionsList.removeWhere((transactionList){
        return transactionList.id==id;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:()=> showModalBottomSheet(
          context: context,
          builder:(_)=>GestureDetector(
              behavior: HitTestBehavior.opaque ,
              onTap: (){},
              child: TextFieldsCard(addTx:addTransaction)),),
      ),

      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Column(
              children: <Widget>[

                Chart(recentTransactions: _recentTransactionList,),

                TransactionsList(transactions:_finalTransactionsList ,funDeleteTransaction:deleteTransaction,)





              ],
            ),
          ],
        ),
      ),
    );
  }
}

