import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageDataSource {

  final ImagePicker imagePicker = ImagePicker();
  Future<File?> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}