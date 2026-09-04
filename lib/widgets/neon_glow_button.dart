import 'package:flutter/material.dart';

class NeonGlowButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  const NeonGlowButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: Colors.white,
            size: 21,
          ),
          const SizedBox(width: 10),
        ],
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
            shadows: [
              Shadow(
                color: Color(0xFF00E5FF),
                blurRadius: 5,
              ),
              Shadow(
                color: Color(0xFF00E5FF),
                blurRadius: 14,
              ),
            ],
          ),
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xAA00E5FF),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x6600E5FF),
            blurRadius: 14,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x442979FF),
            blurRadius: 28,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: const Color(0xAA0A1B27),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          splashColor: const Color(0x3300E5FF),
          highlightColor: const Color(0x2200E5FF),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 14,
            ),
            child: buttonContent,
          ),
        ),
      ),
    );
  }
}
