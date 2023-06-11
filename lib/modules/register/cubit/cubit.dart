import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/modules/login/cubit/cubit.dart';
import 'package:breastcancer1/modules/register/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var uid;

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInit());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    name,
    email,
    password,
    phone,
    role
  }) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          userCreate(name: name,phone: phone,email: email,uid: value.user?.uid,role: role);
          if( role=='Doctor'){
            emit(RegisterDoctorSuccessState());
          }
          else if(role=='User'){
            emit(RegisterUserSuccessState());
          }
    })
        .catchError((error){
          print(error.toString());
    });
  }

  void userCreate({
    name,
    email,
    phone,
    uid,
    role
}){
    UserModel model =UserModel(
      email: email,
      phone: phone,
      name: name,
      uid: uid,
        role:role
    );
    FirebaseFirestore.instance.collection('User').doc(uid).set(model.toMap()).then((value) {
      userModel=model;
      emit(RegisterUserSuccessState());
    });

  }
}
