import 'package:flutter/material.dart';

class RiskFactorItem extends StatelessWidget {
  String first;
  String sec;
   RiskFactorItem(this.first,this.sec,{super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
  children: [
    Expanded(child: Text('$first',style: TextStyle(fontWeight: FontWeight.bold),)),
    Expanded(flex:3,child: Text('$sec')),
  ],
);
  }
}