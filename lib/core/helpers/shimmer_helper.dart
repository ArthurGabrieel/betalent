import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension ShimmerHelper on Shimmer {
  static Widget rectangular({
    required double height,
    double width = double.infinity,
    Color highlightColor = Colors.white,
    double borderRadius = 30,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }

  static Widget circular({
    required double size,
    Color highlightColor = Colors.white,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: highlightColor,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
