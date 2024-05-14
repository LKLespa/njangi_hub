import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/generated/assets.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
              child: Stack(
            children: [
              AvatarDisplay(
                xLabelAlignment: 0.70,
                yLabelAlignment: 0.75,
                rightPos: -100,
                topPos: 0,
                avatarRadius: 75,
                image: Assets.imagesBlackGroup,
              ),
              AvatarDisplay(
                  xLabelAlignment: -0.75,
                  yLabelAlignment: 0.25,
                  rightPos: -100,
                  topPos: 0,
                  avatarRadius: 50,
                  image: Assets.imagesBlackGroup2),
              AvatarDisplay(
                  xLabelAlignment: 0.95,
                  yLabelAlignment: -0.25,
                  rightPos: 25,
                  topPos: -75,
                  avatarRadius: 40,
                  image: Assets.imagesBlackMan),
            ],
          )),
          const Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to NjangiHub',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: primaryColor)),
              Text('Empower learning\nFoster collaboration\nShape futures',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () => {}, child: const Text('Get Started')),
              ),
              const Gap(30)
            ],
          )
        ],
      ),
    );
  }
}

class AvatarDisplay extends StatelessWidget {
  const AvatarDisplay({
    super.key,
    required this.xLabelAlignment,
    required this.yLabelAlignment,
    required this.rightPos,
    required this.topPos,
    required this.avatarRadius,
    required this.image,
  });

  final double xLabelAlignment;
  final double yLabelAlignment;
  final double rightPos;
  final double topPos;
  final double avatarRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xLabelAlignment, yLabelAlignment),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: AssetImage(image),
          ),
          Positioned(
            right: rightPos,
            top: topPos,
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: grayBg,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: primarySecondaryTopDownLinearGradient,
                    ),
                    child: const Icon(Icons.check_rounded, color: Colors.black),
                  ),
                  const Gap(10),
                  const Skeletonizer.zone(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bone.text(
                          words: 2,
                          fontSize: 8,
                        ),
                        Gap(2),
                        Bone.text(
                          words: 1,
                          fontSize: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
