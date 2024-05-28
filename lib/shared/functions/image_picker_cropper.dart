import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:njangi_hub/shared/functions/toast.dart';
import 'package:toastification/toastification.dart';

// TODO: Function for cropping image

Future<File?> pickImage({required bool fromCamera}) async {
  File? imageFile;
  final imageSource = fromCamera ? ImageSource.camera : ImageSource.gallery;
  try {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      toast(message: "No Image Selected", type: ToastificationType.info);
    }
  } catch (error) {
    if (error.toString() ==
        "RangeError (end): Invalid value: Not in inclusive range 0..17: 50") {
      toast(message: "No Image Selected", type: ToastificationType.info);
    } else {
      toast(
          title: "An Error Occurred",
          message: error.toString(),
          type: ToastificationType.error);
    }
  }

  return imageFile;
}

Future<File?> getLostImage() async {
  final ImagePicker picker = ImagePicker();
  final LostDataResponse response = await picker.retrieveLostData();

  final List<XFile>? files = response.files;
  if (files != null && files.isNotEmpty) {
    return File(files.last.path);
  }

  final file = response.file;
  if (file != null) {
    return File(file.path);
  }
  return null;
}
