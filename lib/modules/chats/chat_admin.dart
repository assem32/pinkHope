import 'package:breastcancer1/modules/chats/cubit/cubit.dart';
import 'package:breastcancer1/modules/chats/cubit/state.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:breastcancer1/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatAdmin extends StatelessWidget {
  const ChatAdmin({this.userModel});
  final userModel;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context){
        ChatCubit.get(context).getMessage(userModel.uid);
        ScrollController scrollController=ScrollController();
        return BlocConsumer<ChatCubit,ChatStates>(
          listener: (context,state){},
          builder: (context,state){
            var message=TextEditingController();

            return Scaffold(
              appBar: AppBar(
                title: Text('${userModel.name}'),
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
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                          var message=ChatCubit.get(context).chatList[index].receiverId;
                          if(message!=uid)
                            return senderChatItem(ChatCubit.get(context).chatList[index]);

                          return receiverChatItem(ChatCubit.get(context).chatList[index]);
                        }, separatorBuilder: (context,state)=>SizedBox(height: 1,), itemCount: ChatCubit.get(context).chatList.length),
                      ),


                      Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1
                            )

                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: TextField(
                                  controller: message,

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type your message'
                                  ),

                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              color: Color(0xffce0058),
                              child: MaterialButton(onPressed: () {
                                ChatCubit.get(context).sendMessage(message:message.text,reciverId: userModel.uid ,date: (DateTime.now()).toString());
                                scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                                message.clear();
                              },
                                minWidth: 1,
                                child: Icon(Icons.send,size: 16,color: Colors.white,),),
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
