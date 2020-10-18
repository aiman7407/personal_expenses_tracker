import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double totalPercentage;


  ChartBar({this.label, this.spendingAmount, this.totalPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container( height: 20,child: FittedBox(child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: 4,),

        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(decoration: BoxDecoration(
                  border:Border.all(color:  Colors.purple, width: 1),
                  color: Colors.purple[200]
              ),
              ),
              FractionallySizedBox(
                heightFactor: totalPercentage,
                child:  Container(color: Colors.amber,) ,

              ),

            ],
          ),
        ),

        Text(label)

      ],
    );
  }
}
