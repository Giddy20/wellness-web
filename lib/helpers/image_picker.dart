import 'dart:html' as html;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';


// Rx<File>? image = File("").obs;

RxString selectedImage = ''.obs;
RxString selectedAudio = ''.obs;

Rx<File?> file = File('').obs;
// Uint8List f = Uint8List();

PlatformFile? image;
PlatformFile? image2;
PlatformFile? audio;
PlatformFile? audio2;
// List bytes = [];






// Future<Rx<File>?> cropimage({required File imagefile}) async{
//   CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath:  imagefile.path);
//   if(croppedFile == null) return null;
//   image = File(croppedFile.path).obs;
//   return File(croppedFile.path).obs;
// }

// Future<String> uploadFile(File image) async
// {
//   String downloadURL;
//   String postId=DateTime.now().millisecondsSinceEpoch.toString();
//   Reference ref = FirebaseStorage.instance.ref().child("images").child("post_$postId.jpg");
//   await ref.putFile(image);
//   downloadURL = await ref.getDownloadURL();
//   return downloadURL;
// }


// Future getImageFromCamera(ImageSource source) async {
//   final pickedFile = await picker.pickImage(source: source);
//
//   if (pickedFile != null) {
//     image = File(pickedFile.path).obs;
//     // cropimage(imagefile: image!.value);
//     imageHeight.value = 0.2;
//     path.value= image!.value.path;
//     visibility = true.obs;
//     Get.back();
//
//
//   } else {
//     print('No image selected.');
//   }
// }