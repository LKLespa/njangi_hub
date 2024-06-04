import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class AttachmentModal extends StatelessWidget {
  const AttachmentModal({super.key, this.onPickImage, this.onPickFile, this.onPickVideo, this.onPickAudio});
  final void Function()? onPickImage;
  final void Function()? onPickFile;
  final void Function()? onPickVideo;
  final void Function()? onPickAudio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          buildItem(child: InkWellIconButton(onPressed: onPickFile ?? (){}, icon: Icons.file_present_outlined), text: "File"),
          buildItem(child: InkWellIconButton(onPressed: onPickAudio ?? (){}, icon: Icons.audio_file), text: "Audio"),
          buildItem(child: InkWellIconButton(onPressed: onPickVideo ?? (){}, icon: Icons.video_file), text: "Video"),
          buildItem(child: InkWellIconButton(onPressed: onPickFile ?? (){}, icon: Icons.image), text: "Image"),
        ],
      ),
    );
  }

  Widget buildItem({required Widget child, required String text}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child,
        Text(text),
      ],
    );
  }
}
