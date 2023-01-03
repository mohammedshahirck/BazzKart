import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.color,
    // required this.secondring,
    // required this.thirdring,
  });
  final Color color;
  // final Color secondring;
  // final Color thirdring;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: color,
        size: 35,
        secondRingColor: Colors.white12,
        thirdRingColor: Colors.white24,
      ),
    );
  }
}
