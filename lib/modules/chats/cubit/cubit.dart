import 'package:breastcancer1/models/message_model.dart';
import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/modules/chats/cubit/state.dart';
import 'package:breastcancer1/modules/login/cubit/cubit.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// var receiverId;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInit());

  static ChatCubit get(context) => BlocProvider.of(context);


  void sendMessage(
  {
    message,
    reciverId,
    senderId,
    date,
}
      ){
    ChatModel model=ChatModel(
      message: message,
      receiverId: reciverId,
      senderId: senderId,
      date: date,
    );
    FirebaseFirestore.instance.collection('User').doc(userModel?.uid).collection('Chats').doc(reciverId).collection('Message').add(
        model.toMap()).then((value){
          emit(SendMessageState());
    }).catchError((error){
      print(error.toString());
    });

    FirebaseFirestore.instance.collection('User').doc(reciverId).collection('Chats').doc(userModel?.uid).collection('Message').add(
        model.toMap()).then((value){
      emit(SendMessageState());
    }).catchError((error){
      print(error.toString());
    });
  }


  List<UserModel> userOnlyList=[];
  void userSearch(){
    userOnlyList = usersList
        .where((element) => element.role!.contains('User'))
        .toList();
    emit(SearchUserState());
  }

  List <ChatModel>chatList=[];
  void getMessage(receiverId){
    print('whhyyyy${receiverId}');
    print(uid);
    FirebaseFirestore.instance.collection('User')
        .doc(userModel?.uid)
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

  List<UserModel> usersList=[];
  void getUsers(){
    FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        usersList.add(UserModel.fromJson(element.data()));
      });
      userSearch();
      emit(GetUsersState());
    }).catchError((error){
      print(error.toString());
    });
  }

}