import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer(
      {super.key, required this.url, required this.source, this.imageTag = ""});
  final String? url;
  final FileSource source;
  final String imageTag;

  @override
  Widget build(BuildContext context) {
    final imageWidget =
        getImageWidgetFromSource(path: url, source: source, showLoading: true);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 5,
          child: Hero(tag: imageTag, child: imageWidget),
        ),
      ),
    );
  }
}
