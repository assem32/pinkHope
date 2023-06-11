import 'package:breastcancer1/cubit/cubit.dart';
import 'package:breastcancer1/cubit/state.dart';
import 'package:breastcancer1/modules/chats/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>PateintCubit()..getUsers(),
      child: BlocConsumer<PateintCubit,PateintState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.grey[300],

            appBar: AppBar(
              title: Text('Choose your doctor'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: ListView.separated(itemBuilder: (context,index)=>
                      Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                borderRadius: BorderRadius.circular(26)
          ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: (){
                              var id=PateintCubit.get(context).doctorsList[index];
                              print(id.uid);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat(umodel: id,)));
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1684931764~exp=1684932364~hmac=084c773a9c476e38cb509615d7a2d4d7e909503b49d5863600ada2ce8dfc05ae'

                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text('${PateintCubit.get(context).doctorsList[index].name}')
                              ],
                            ),
                          ),
                        ),
                      ),

                      separatorBuilder: (context,index)=>SizedBox(
                        height: 12,
                      ), itemCount: PateintCubit.get(context).doctorsList.length)
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
