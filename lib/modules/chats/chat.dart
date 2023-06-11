import 'package:breastcancer1/modules/chats/cubit/cubit.dart';
import 'package:breastcancer1/modules/chats/cubit/state.dart';
import 'package:breastcancer1/modules/login/cubit/cubit.dart';
import 'package:breastcancer1/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Chat extends StatelessWidget {
   Chat({this.umodel}) ;
   final umodel;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context){
        ChatCubit.get(context).getMessage(umodel?.uid);
        print('hee${umodel.uid}');
        var senderid= userModel?.uid;
        print(senderid);


        ScrollController scrollController=ScrollController();
        return BlocConsumer<ChatCubit,ChatStates>(
          listener: (context,state){},
          builder: (context,state){
            var message=TextEditingController();
            return Scaffold(
              appBar: AppBar(
                title: Text('Chat with the doctor'),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          reverse: true,
                            itemBuilder: (context,index){
                          var message=ChatCubit.get(context).chatList[index];
                          if(message.receiverId==umodel?.uid)
                            return senderChatItem(ChatCubit.get(context).chatList[index]);

                            return receiverChatItem(ChatCubit.get(context).chatList[index]);
                        }, separatorBuilder: (context,state)=>SizedBox(height: 6,), itemCount: ChatCubit.get(context).chatList.length),
                      ),


                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(26)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: message,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                ),

                              ),
                            ),
                            Container(
                              height: 60,
                              color: Color(0xffce0058),
                              child: MaterialButton( onPressed: () {
                                ChatCubit.get(context).sendMessage(message:message.text,reciverId: umodel?.uid ,date: (DateTime.now()).toString(),senderId:senderid);
                                scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                                message.clear();
                              },
                                minWidth: 1.0,
                                child: Container(
                                  child: Icon(Icons.send,size: 16,color: Colors.white,)),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
  },
    );
  }
}
