import 'package:flutter/material.dart';

class NeonIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const NeonIcon({
    super.key,
    required this.icon,
    this.size = 28,
    this.color = const Color(0xFF00E5FF),
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      shadows: [
        Shadow(
          color: color.withOpacity(0.9),
          blurRadius: 5,
        ),
        Shadow(
          color: color.withOpacity(0.7),
          blurRadius: 14,
        ),
        Shadow(
          color: color.withOpacity(0.45),
          blurRadius: 28,
        ),
      ],
    );
  }
}
