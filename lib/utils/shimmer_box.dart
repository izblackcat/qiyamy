import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const ShimmerBox({super.key, required this.height, required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}