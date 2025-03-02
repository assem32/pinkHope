import 'package:breastnew/feature/drawer/data/dataSource/remote/DoctorsRemote.dart';
import 'package:breastnew/feature/drawer/data/repo/DoctorsRepoImp.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/GetMessagesUseCase.dart';
import 'package:breastnew/feature/drawer/domain/UseCase/SendMessageUseCase.dart';
import 'package:breastnew/feature/drawer/presentation/chat/manger/cubit.dart';
import 'package:breastnew/feature/drawer/presentation/chat/manger/state.dart';
import 'package:breastnew/feature/drawer/presentation/chat/widgets/ChatTextFormField.dart';
import 'package:breastnew/feature/drawer/presentation/chat/widgets/MessageListView.dart';
import 'package:breastnew/feature/home/data/dataSource/remote/remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  String reciverId;
  ChatScreen(this.reciverId, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return BlocProvider(
      create:
          (BuildContext context) => ChatCubit(SendMessageUsecase(DoctorsRepoImp(DoctorsRemote())),GetMessageUsecase(DoctorsRepoImp(DoctorsRemote())))..getMessage(reciverId),
      child: BlocBuilder<ChatCubit,ChatStates>(
        builder: (context, state) {
          return Scaffold(
          body: Column(
            children: [
              Expanded(child: MessageListView(ChatCubit.get(context).messageList)),
              ChattextFormField(messageController, () {
                ChatCubit.get(context).sendMessage(reciverId,messageController.text);
              }),
            ],
          ),
        );
        },
         
      ),
    );
  }
}
