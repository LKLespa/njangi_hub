import 'dart:io';

import 'package:flutter/cupertino.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:njangi_hub/shared/functions/toast.dart';
import 'package:toastification/toastification.dart';

Future<File?> pickImage(
    {required BuildContext context, required bool fromCamera}) async {
  File? imageFile;
  final imageSource = fromCamera ? ImageSource.camera : ImageSource.gallery;
  try {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      if (context.mounted) {
        toast(
            context: context,
            message: "No Image Selected",
            type: ToastificationType.info);
      }
    }
  } catch (error) {
    print("error.message ${error}");

    if (context.mounted) {
      if (error.toString() ==
          "RangeError (end): Invalid value: Not in inclusive range 0..17: 50") {
        toast(
            context: context,
            message: "No Image Selected",
            type: ToastificationType.info);
      } else {
        toast(
            context: context,
            title: "An Error Occurred",
            message: error.toString(),
            type: ToastificationType.error);
      }
    }
  }

  return imageFile;
}

// TODO: Get lost image
Future<File?> getLostImage() async {
  final ImagePicker picker = ImagePicker();
  final LostDataResponse response = await picker.retrieveLostData();

  final List<XFile>? files = response.files;
  if (files != null && files.isNotEmpty) {
    print("Image exist in list of files $files");
    return File(files.last.path);
  }

  final file = response.file;
  if (file != null) {
    print("Image exist in file $file");
    return File(file.path);
  }
  print("No Image found in Lost Data response");
  return null;
}
//
// Future<File?> cropImage(imageFilePath) async{
//   final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFilePath,
//     maxHeight: 400,
//     maxWidth: 400,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.square,
//     ],
//     compressQuality: 80,
//   );
//
//   return croppedFile != null ? File(croppedFile.path) : null;
// }