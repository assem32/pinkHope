import 'package:breastnew/feature/auth/data/models/UserModel.dart';
import 'package:breastnew/feature/drawer/data/model/MessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DoctorsRemote {
  Future<List<UserModel>> getDoctors() async {
    List<UserModel> doctorsList = [];
    await FirebaseFirestore.instance.collection('Doctor').get().then((value) {
      value.docs.forEach((element) {
        doctorsList.add(UserModel.fromJson(element.data()));
      });
    });
    print(doctorsList);
    return doctorsList;
  }

  DatabaseReference ref1 = FirebaseDatabase.instance.ref();
  void sendMessages(String? reciverId, String message) {
    ref1
        .child('Messages')
        .child(FirebaseAuth.instance.currentUser!.uid.toString() + reciverId!)
        .push()
        .set(
          MessageModel(
            date: DateTime.now().toIso8601String(),
            message: message,
            senderId: FirebaseAuth.instance.currentUser!.uid.toString(),
          ).toMap(),
        )
        .then((d) {})
        .catchError((e) {
          print(e.toString());
        });
  }

  List<MessageModel> getMessage(String? receiverId) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    List<MessageModel> model = [];

    final path1 = '$currentUserId$receiverId';
    final path2 = '$receiverId$currentUserId';

    ref1.child('Messages').child(path1).onChildAdded.listen((event) {
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;
      MessageModel messageModel = MessageModel.fromJson(data);
      model.add(messageModel);
    });

    ref1.child('Messages').child(path2).onChildAdded.listen((event) {
      Map<dynamic, dynamic> data =
          event.snapshot.value as Map<dynamic, dynamic>;
      MessageModel messageModel = MessageModel.fromJson(data);
      model.add(messageModel);
    });
    return model;
  }
}
