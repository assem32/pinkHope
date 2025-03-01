import 'dart:io';

import 'package:breastnew/feature/home/domain/repo/IHomeRepo.dart';

class PickImageUsecase {
  IHomeRepo iHomeRepo;
  PickImageUsecase(this.iHomeRepo);
  Future<File?> pickImage() async {
    return await iHomeRepo.pickImge();
  }

 
}
