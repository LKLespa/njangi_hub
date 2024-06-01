import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class UserImageAvatar extends StatelessWidget {
  const UserImageAvatar(
      {super.key,
        this.url,
        this.onTap,
        this.radius = 25,
        required this.imageSource});

  final String? url;
  final void Function()? onTap;
  final double radius;
  final FileSource imageSource;

  @override
  Widget build(BuildContext context) {
    final imageProvider = getImageProviderFromSource(
        path: url, source: imageSource, placeholder: Assets.imagesUser);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Padding(
            padding: EdgeInsets.all(onTap == null ? 0 : 5),
            child: Container(
              width: radius*2,
              height: radius*2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                ),
              ),
            )),
      ),
    );
  }
}