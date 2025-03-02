import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:breastnew/feature/drawer/presentation/chat/widgets/MessageItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageListView extends StatelessWidget {
  List<MessageModel> messageList;
  MessageListView(this.messageList,{super.key});
   

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index){
        var messageId=messageList[index].senderId;
        if(messageId==FirebaseAuth.instance.currentUser!.uid)
        {
          print(messageId);
        print(FirebaseAuth.instance.currentUser!.uid);
        return Align(
          alignment: Alignment.centerRight,
          child: MessageItem(
          model: messageList[index],
          color: 0xffeafcca,
                ),
        );}
        else{
          return Align(
          alignment: Alignment.centerLeft,
          child: MessageItem(
          model: messageList[index],
          color: 0xfff0f9fb,
                ),
        );
        }
      },
      separatorBuilder: (context,index)=>SizedBox(
        height: 10,
      ),
      itemCount: messageList.length,
    );
  }
}