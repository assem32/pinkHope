import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:breastcancer1/cubit/state.dart';
import 'package:breastcancer1/models/user_model.dart';
import 'package:breastcancer1/shared/network/remote/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class PateintCubit extends Cubit<PateintState> {
  PateintCubit() : super(InitState());

  static PateintCubit get(context) => BlocProvider.of(context);

  File? imageFile;

  final picker = ImagePicker();

  var result;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 250,
        maxWidth: 250);
    imageFile = pickedFile != null ? File(pickedFile.path) : null;
    emit(GetImageState());
  }

  void predictImage(formData) {
    DioHelper.postImage(url: 'predict', query: formData).then((value) {
      print(value.data['class']);
      result = value.data['class'];
      emit(GetImagePredictionState());
    }).catchError((error) {
      print(error.toString());
    });
    emit(GetImagePredictionState());
  }

  void setToEmpty() {
    result = null;
    emit(SetToZeroState());
  }

  List<UserModel> doctorsList = [];

  void doctorSearch() {
    doctorsList = usersList
        .where((element) => element.role!.contains('Doctor'))
        .toList();
    emit(GetDoctorState());
  }

  List<UserModel>usersList = [];

  void getUsers() {
    FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        usersList.add(UserModel.fromJson(element.data()));
      });
      doctorSearch();
      print(usersList);
      emit(GetUsersState());
    }).catchError((error) {
      print(error.toString());
    });
  }

}