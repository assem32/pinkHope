import 'package:flutter/material.dart';

Widget ristFactor({first,sec})=>Row(
  children: [
    Expanded(child: Text('$first',style: TextStyle(fontWeight: FontWeight.bold),)),
    Expanded(flex:3,child: Text('$sec')),
  ],
);