import 'package:breastcancer1/models/message_model.dart';
import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/modules/chats/cubit/state.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var receiverId;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInit());

  static ChatCubit get(context) => BlocProvider.of(context);


  void sendMessage(
  {
    message,
    reciverId,
    date
}
      ){
    ChatModel model=ChatModel(
      message: message,
      receiverId: reciverId,
      date: date,
    );
    FirebaseFirestore.instance.collection('User').doc(uid).collection('Chats').doc(reciverId).collection('Message').add(
        model.toMap()).then((value){
          emit(SendMessageState());
    }).catchError((error){
      print(error.toString());
    });

    FirebaseFirestore.instance.collection('User').doc(reciverId).collection('Chats').doc(uid).collection('Message').add(
        model.toMap()).then((value){
      emit(SendMessageState());
    }).catchError((error){
      print(error.toString());
    });
  }

  List <ChatModel>chatList=[];
  void getMessage(receiverId){
    print(receiverId);
    print(uid);
    FirebaseFirestore.instance.collection('User')
        .doc(uid)
        .collection('Chats')
        .doc(receiverId)
        .collection('Message')
        .orderBy('date',descending: true)
        .snapshots().listen((event) {
          chatList=[];
          event.docs.forEach((element) {
            chatList.add(ChatModel.fromJson(element.data()));
          });
          emit(GetMessageState());

    });

  }

  List<UserModel> usersModel=[];
  void getUsers(){
    FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        usersModel.add(UserModel.fromJson(element.data()));
      });
      emit(GetUsersState());
    }).catchError((error){
      print(error.toString());
    });
  }
}