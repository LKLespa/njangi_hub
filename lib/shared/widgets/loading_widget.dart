import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:njangi_hub/shared/shared.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final _overlayController = OverlayPortalController();

  @override
  void initState() {
    super.initState();
    _overlayController.show();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.background.withOpacity(0.7),
          child: Center(
            child: LoadingAnimationWidget.beat(color: primaryColor, size: 50),
          ),
        );
      },
    );
  }
}
