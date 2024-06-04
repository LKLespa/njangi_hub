import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class InkWellIconButton extends StatelessWidget {
  const InkWellIconButton(
      {super.key,
      required this.onPressed,
      this.radius = 30,
      this.iconColor = Colors.white,
      this.background = primaryColor,
      this.padding = 10,
      this.iconSize = 30, required this.icon});
  final void Function() onPressed;
  final double radius;
  final Color iconColor;
  final Color background;
  final double padding;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: radius,
      borderRadius: BorderRadius.circular(radius),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
