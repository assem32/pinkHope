import 'package:breastcancer1/modules/chats/chat.dart';
import 'package:breastcancer1/modules/chats/chat_admin.dart';
import 'package:breastcancer1/modules/chats/cubit/cubit.dart';
import 'package:breastcancer1/modules/chats/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChatCubit()..getUsers(),
      child: BlocConsumer<ChatCubit,ChatStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text('Patient to chat with '),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(child: ListView.separated(itemBuilder: (context,index)=>
                      InkWell(
                        onTap: (){
                          var id=ChatCubit.get(context).userOnlyList[index];
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatAdmin(userModel:id,)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage('assets/admin image.png'),
                                  radius: 26,
                                ),
                                Text('${ChatCubit.get(context).userOnlyList[index].name}')
                              ],
                            ),
                          ),
                        ),
                      ), separatorBuilder: (context,index)=>SizedBox(height: 20,), itemCount: ChatCubit.get(context).userOnlyList.length)
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
