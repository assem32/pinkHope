import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key,required this.model,required this.color});

  final MessageModel model;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(color),
      ),
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(model.message.toString()),
      )
    );
  }
}