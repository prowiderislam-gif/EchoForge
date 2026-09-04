import 'package:flutter/material.dart';

class NeonGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const NeonGlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0x66101F2C),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: const Color(0x9900E5FF),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x5500E5FF),
            blurRadius: 18,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x332979FF),
            blurRadius: 35,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
