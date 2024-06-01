import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

Future<String?> selectImage({required BuildContext context}) async {
  File? fileImage;
  String? imagePath;
  Future<void> onSelect(bool camera) async {
    fileImage = await pickImage(fromCamera: camera);
    if (fileImage != null) {
      // TODO: Crop the image
      imagePath = fileImage!.path;
      // }
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  if (context.mounted) {
    await showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        width: double.maxFinite,
        height: 200,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.camera,
                  size: 20,
                ),
                title: const Text('From Camera'),
                onTap: () => onSelect(true),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.image,
                  size: 20,
                ),
                title: const Text('From Gallery'),
                onTap: () => onSelect(false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  return imagePath;
}
