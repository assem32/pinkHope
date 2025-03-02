import 'package:flutter/material.dart';

class SymptomsItem extends StatelessWidget {
  String text,img;
  SymptomsItem(this.text,this.img,{super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  Expanded(flex:2,child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(child: Image.asset(img,width: 75,height: 100,))
                ],
              );
  }
}