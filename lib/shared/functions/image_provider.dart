import 'dart:io';

import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';

ImageProvider getImageProviderFromSource(
    {required String? path, required FileSource source, String? placeholder}) {
  if(path == null){
    if (placeholder != null){
      return AssetImage(placeholder);
    }
    return const AssetImage(Assets.imagesImagePlaceholder);
  }

  switch (source) {
    case FileSource.network:
      return NetworkImage(path);
    case FileSource.cachedNetwork:
      return CachedNetworkImageProvider(path);
    case FileSource.asset:
      return AssetImage(path);
    case FileSource.file:
      return FileImage(File(path));
    case FileSource.memory:
      return MemoryImage(File(path).readAsBytesSync());
  }
}

Widget getImageWidgetFromSource(
    {required String? path,
    required FileSource source,
    String? placeholderImage,
    bool showLoading = true,
    double loadingSize = 10}) {
  if (path == null) {
    if (placeholderImage != null) {
      return Image.asset(placeholderImage);
    }
    return const SizedBox();
  }

  switch (source) {
    case FileSource.network:
      return Image.network(path);
    case FileSource.asset:
      return Image.asset(path);
    case FileSource.file:
      return Image.file(File(path));
    case FileSource.memory:
      return Image.memory(File(path).readAsBytesSync());
    case FileSource.cachedNetwork:
      return CachedNetworkImage(
        imageUrl: path,
        placeholder: placeholderImage != null && !showLoading
            ? (context, url) => Image.asset(placeholderImage)
            : null,
        progressIndicatorBuilder: showLoading
            ? (context, url, progress) => CircularProgressIndicator(
                  value: progress.progress,
                )
            : null,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
  }
}