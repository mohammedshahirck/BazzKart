import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangle({
    super.key,
    required this.height,
    required this.width,
    this.shape = BoxShape.rectangle,
    this.radius,
    this.child,
  });

  const ShimmerWidget.circle(
      {super.key,
      required this.height,
      required this.width,
      this.shape = BoxShape.circle,
      this.radius,
      this.child});

  final double height;
  final Widget? child;
  final double width;
  final BoxShape shape;
  final BorderRadiusGeometry? radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: shape,
          borderRadius: radius,
        ),
      ),
    );
  }
}
