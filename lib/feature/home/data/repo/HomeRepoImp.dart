import 'dart:io';

import 'package:breastnew/feature/home/data/dataSource/local/imageDataSource.dart';
import 'package:breastnew/feature/home/data/dataSource/remote/remote.dart';
import 'package:breastnew/feature/home/domain/repo/IHomeRepo.dart';

class HomeRepoImpl extends IHomeRepo{

  ImageDataSource dataSource;
  Remote remote;
  HomeRepoImpl(this.dataSource,this.remote);
  @override
  Future<File?> pickImge() async{
    return await dataSource.pickImageFromGallery();
  }
  
  @override
  Future<dynamic> predict(data)async {
    return await remote.predict(data);
  }

}