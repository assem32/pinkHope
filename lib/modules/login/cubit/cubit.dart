import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/modules/login/cubit/state.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    email,
    password,
}){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(LoginSuccessState(value.user!.uid));
          uid=value.user!.uid;
    })
        .catchError((error){
          print(error.toString());
    });
  }



}