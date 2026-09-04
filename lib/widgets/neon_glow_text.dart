import 'package:flutter/material.dart';

class NeonGlowText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const NeonGlowText(
    this.text, {
    super.key,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: 0.6,
        shadows: const [
          Shadow(
            color: Color(0xFF00E5FF),
            blurRadius: 4,
          ),
          Shadow(
            color: Color(0xFF00E5FF),
            blurRadius: 12,
          ),
          Shadow(
            color: Color(0xFF2979FF),
            blurRadius: 24,
          ),
        ],
      ),
    );
  }
}
