import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          color: bgColor,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-1, -1),
                child: RotatedBox(
                    quarterTurns: 2,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(Assets.imagesGradient1TopLeft),
                    )),
              ),
              Align(
                  alignment: const Alignment(1, 1),
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(Assets.imagesGradient1TopLeft),
                  )),
              Align(
                alignment: const Alignment(-1, -0.25),
                child: Opacity(
                    opacity: 1, child: Image.asset(Assets.imagesPolygon05)),
              ),
              Align(
                alignment: const Alignment(-1, 0.75),
                child:
                    Opacity(opacity: 1, child: Image.asset(Assets.imagesCube)),
              ),
            ],
          ),
        ),
        child,
      ]),
    );
  }
}
