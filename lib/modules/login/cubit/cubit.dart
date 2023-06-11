import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/modules/admin.dart';
import 'package:breastcancer1/modules/image.dart';
import 'package:breastcancer1/modules/login/cubit/state.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

UserModel? userModel;

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
    context}){
    // emit(SocialLoadingLoginState());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: email,
        password: password
    ).then((value) {
      FirebaseFirestore.instance.collection('User').doc(value.user?.uid).get().then((value) {
        userModel=UserModel.fromJson(value.data()!);
        print(userModel);
        if(userModel?.role=='User'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ImagePickerPage()), (route) => false);
          emit(LoginSuccessState());

        }
        if(userModel?.role=='Doctor'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Admin()), (route) => false);
          emit(LoginDoctorSuccessState());
        }
      }).catchError((error){
        print(error.toString());
      });
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorLoginState());
    });
  }



}