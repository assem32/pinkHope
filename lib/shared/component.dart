import 'package:breastcancer1/models/message_model.dart';
import 'package:flutter/material.dart';

Widget ristFactor({first,sec})=>Row(
  children: [
    Expanded(child: Text('$first',style: TextStyle(fontWeight: FontWeight.bold),)),
    Expanded(flex:3,child: Text('$sec')),
  ],
);


Widget receiverChatItem(ChatModel model)=>Align(
  alignment: AlignmentDirectional.centerStart,
  child: Container(
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topLeft:  Radius.circular(20),topRight: Radius.circular(20) )
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('${model.message}'),
    ),
  ),
);

Widget senderChatItem(ChatModel model)=>Align(
  alignment: AlignmentDirectional.centerEnd,

  child: Container(
    decoration: BoxDecoration(
        color: Color(0xffce0058).withOpacity(0.5),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft:  Radius.circular(20),topRight: Radius.circular(20) )
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('${model.message}'),
    ),
  ),
);