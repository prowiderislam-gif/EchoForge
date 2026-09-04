import 'package:flutter/material.dart';

class NeonGlowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  const NeonGlowContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0x66101A24),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: const Color(0x8800E5FF),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4400E5FF),
            blurRadius: 12,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x332979FF),
            blurRadius: 28,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
