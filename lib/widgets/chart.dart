import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/model/transactions.dart';
import 'package:personalexpenses/widgets/charts_bar.dart';


class Chart extends StatelessWidget {
final List<Transactions> recentTransactions;
Chart({this.recentTransactions});

List<Map<String,Object>> get groupedTransactionsValue{
  return List.generate(7,
          (index){
    final weekDay=DateTime.now().subtract(Duration(days: index));
    var totalSum=0.0;
    for(var i=0;i<recentTransactions.length;i++)
      {
        if(recentTransactions[i].date.day==weekDay.day&&
            recentTransactions[i].date.month==weekDay.month&&
            recentTransactions[i].date.year==weekDay.year)
          {
           totalSum+=recentTransactions[i].amount;
          }

      }

    return{
      'day':DateFormat.E().format(weekDay)//.substring(0,1)
      ,'amount':totalSum
    };
  }
  ).reversed.toList();
}

double get totalSpending
{
return groupedTransactionsValue.fold(0.0, (sum,item){

  return sum+item['amount'];
});
}



@override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height*0.174 ,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValue.map((data){

            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(label:data['day'] ,
                spendingAmount: data['amount'] ,
                totalPercentage: totalSpending==0? 0:  (data['amount'] as double )/totalSpending ,
                //totalPercentage: ,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
