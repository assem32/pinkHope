import 'dart:io';

import 'package:breastnew/feature/home/domain/useCase/HomeUseCase.dart';
import 'package:breastnew/feature/home/domain/useCase/PredictionUseCase.dart';
import 'package:breastnew/feature/home/presentation/manger/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final PickImageUsecase homeUsecase;
  final PredictionUsecase predictionUsecase;

  HomeCubit(this.homeUsecase,this.predictionUsecase) : super(HomeInit());

  static HomeCubit get(context) => BlocProvider.of(context);

  var img;
  Future<void> imagePickedUsecase() async {
    img = await homeUsecase.pickImage();
    print(img.path);
    emit(ImageSelected());
  }

  Future<dynamic> predictUsecase(data) async {
    return await predictionUsecase.predict(data);
  }

  void update() {
    emit(ImageSelected());
  }
}
