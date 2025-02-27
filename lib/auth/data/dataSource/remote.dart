import 'package:breastnew/auth/data/models/UserModel.dart';
import 'package:breastnew/auth/presentation/login/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RemoteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> login(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  Future <UserModel> register(
    String name,
    String email,
    String password,
    String phone,
    String role,
  ) async{
    var usercred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel model = createUser(name, email, password, phone, role, usercred.user!.uid);
    return model;
  }

  UserModel createUser(
    String name,
    String email,
    String password,
    String phone,
    String role,
    String uid,
  ) {
    UserModel model = UserModel(
      email: email,
      phone: phone,
      name: name,
      uid: uid,
      role: role,
    );
    FirebaseFirestore.instance.collection("User").doc(uid).set(model.toMap());
    return model;
  }
}
